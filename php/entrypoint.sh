#!/usr/bin/env bash

set -e

# setup handlers
trap 'kill ${!}; exit 143' SIGTERM

# Run our defined exec if args empty
if [ -z "$1" ]; then

    if [ "$role" = "app" ]; then
      if [ -d "/var/www/vendor" ]; then
          echo "Caching configuration..."
          (php artisan cache:clear && php artisan config:clear && php artisan route:clear && php artisan view:clear)
          (php artisan config:cache && php artisan event:cache && php artisan route:cache && php artisan view:cache)
      fi

        echo "Running PHP-FPM..."
        exec php-fpm

    elif [ "$role" = "queue" ]; then

        echo "Running the queue..."
        exec php artisan queue:work -vv --no-interaction --tries=3 --sleep=5 --timeout=300 --delay=10

    elif [ "$role" = "cron" ]; then

        echo "Running the cron..."
        while :
        do
          php artisan schedule:run -vv --no-interaction
          sleep 60 &
          wait $!
        done

    else
        echo "Could not match the container role \"$role\""
        exit 1
    fi

else
    exec "$@"
fi
