FROM php:7.4-fpm
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libicu-dev \
        libc-client-dev \
        libkrb5-dev \
    && docker-php-ext-configure \
        imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install -j$(nproc) \
        mysqli \
        gd \
        intl \
        imap \
        opcache \
    && pecl install \
        apcu \
    && docker-php-ext-enable \
        apcu