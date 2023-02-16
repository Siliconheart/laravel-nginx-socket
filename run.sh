#!/bin/bash
if [ ! -d app/public ]; then mv app/.env.docker .env.docker ; git clone https://github.com/laravel/laravel.git app ; mv .env.docker app/.env.docker ; fi
if [ ! -f app/.env ]; then cp app/.env.docker app/.env ; fi
docker compose up -d app
docker compose exec app composer install
docker compose exec app php artisan key:generate
docker compose exec app php artisan migrate
docker compose up -d
