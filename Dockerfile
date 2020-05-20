FROM php:7.3-fpm

RUN apt-get update && \
    apt-get install -y libpng-dev libjpeg-dev libpq-dev zip unzip sudo wget zlib1g-dev libicu-dev libzstd-dev libzip-dev g++ && \
    rm -rf /var/lib/apt/lists/*

RUN yes | pecl install igbinary redis grpc protobuf xdebug-2.9.3

RUN docker-php-ext-install intl && \
    docker-php-ext-install gd && \
    docker-php-ext-install mbstring && \
    docker-php-ext-install opcache && \
    docker-php-ext-install zip && \
    docker-php-ext-install calendar && \
    docker-php-ext-install sockets && \
    docker-php-ext-enable igbinary && \
    docker-php-ext-enable redis && \
    docker-php-ext-enable grpc && \
    docker-php-ext-enable protobuf && \
    docker-php-ext-enable xdebug

## Install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
