FROM php:8.2-fpm-alpine

RUN apk add --no-cache pcre-dev $PHPIZE_DEPS \
    && apk --no-cache add postgresql-dev \
    && pecl install redis \
    && docker-php-ext-install pdo pdo_pgsql \
    && docker-php-ext-enable pdo_pgsql redis

COPY ./app .