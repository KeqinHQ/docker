FROM php:8-fpm

# persistent / runtime deps
RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		zip \
		unzip \
	; \
	rm -rf /var/lib/apt/lists/*

# Register the COMPOSER_HOME environment variable
ENV COMPOSER_HOME /composer

# Add global binary directory to PATH and make sure to re-export it
ENV PATH /composer/vendor/bin:$PATH

# Allow Composer to be run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN composer global require laravel/installer

ENTRYPOINT ["docker-php-entrypoint"]

VOLUME /var/www
WORKDIR /var/www

CMD php-fpm