FROM php:8.2-fpm-alpine as app

RUN apk add --no-cache pcre-dev $PHPIZE_DEPS \
    && apk --no-cache add postgresql-dev \
    && pecl install redis \
    && docker-php-ext-install pdo pdo_pgsql \
    && docker-php-ext-enable pdo_pgsql redis

COPY ./app .


FROM app as app_dev

ENV XDEBUG_MODE=off

COPY ./cfg/php/conf.d/xdebug.ini $PHP_INI_DIR/conf.d/xdebug.ini

RUN apk add --update linux-headers \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug