#!/bin/sh

if [ ! -f "/var/www/html/wp-config.php" ]; then
    wp config create \
        --dbname=$WP_DB_NAME \
        --dbuser=$WP_DB_USER \
        --dbpass=$WP_DB_PASSWORD \
        --dbhost=$WP_DB_HOST \
        --path=/var/www/html/ \
        --skip-check
fi

