#!/bin/bash

ENV_FILE="srcs/.env"

if [ "$(uname)" == "Darwin" ]; then
    # macOS
    BASE_DIR="/Users/$USER/data"
else
    # Linux
    BASE_DIR="/home/$USER/data"
fi

if [ ! -d "$BASE_DIR" ]; then
    echo "Make Directories..."
    echo "BASE_DIR: $BASE_DIR"  
	mkdir -p $BASE_DIR/mariadb/ $BASE_DIR/wordpress/
    chmod 755 $BASE_DIR/mariadb/ $BASE_DIR/wordpress/
    echo "MAKE DIR COMPLETE!!!"
fi

if ! grep -q "DATA_PATH=" $ENV_FILE; then
    echo "ADD DATA_PATH to .env file..."
	if [ -s $ENV_FILE ] && [ "$(tail -c 1 $ENV_FILE | wc -l)" -eq 0 ]; then
    echo "" >> $ENV_FILE
	fi
    echo "DATA_PATH=$BASE_DIR" >> $ENV_FILE
    echo "ADD DATA_PATH COMPLETE!!!"
fi

if [ "$1" == "--delete" ]; then
    echo "Delete Directories..."
    rm -rf $BASE_DIR
    echo "DELETE DIR COMPLETE!!!"
fi