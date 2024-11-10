#!/bin/sh

wp core install \
    --allow-root \
    --url=$WP_URL \
    --title=$WP_TITLE \
    --admin_user=$WP_ADMIN_USER \
    --admin_password=$WP_ADMIN_PASSWORD \
    --admin_email=$WP_ADMIN_EMAIL \
    --locale=$WP_LOCALE \

wp user create \
    $WP_USER \
    $WP_USER_EMAIL \
    --user_pass=$WP_USER_PASSWORD

exec "$@"