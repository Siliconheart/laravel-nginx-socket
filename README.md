# Laravel - nginx - socket

docker-compose based Docker setup for a Laravel project.
Includes services for queue and cron (schedule:run)

Services:

- php-fpm
- nginx
- Mariadb
- RabbitMQ (disabled)
- Redis

## Instructions:

- Copy your Laravel app to the app/ folder
- Edit docker-compose.yml if you don't need some services (don't forget to remove dependencies)
- Edit app/.env.docker according to your needs
- Check other conf files in other folders
- run run.sh
- Open localhost in your browser
- Use app_db app_user app_password for Adminer (localhost:8080)