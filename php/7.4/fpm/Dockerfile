FROM php:7.4-fpm-alpine

# Packages
RUN apk --update add \
    aspell-dev \
    autoconf \
    build-base \
    linux-headers \
    libaio-dev \
    zlib-dev \
    curl \
    git \
    subversion \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libtool \
    libbz2 \
    libzip \
    libzip-dev \
    bzip2-dev \
    libstdc++ \
    libxslt-dev \
    openldap-dev \
    imagemagick-dev \
    hiredis-dev \
    oniguruma-dev \
    make \
    unzip \
    ffmpeg \
    wget \
    fcgi && \
    docker-php-ext-install bcmath zip bz2 pdo_mysql mysqli simplexml opcache sockets mbstring pcntl xsl pspell && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    pecl install redis && \
    docker-php-ext-enable redis && \
    pecl install xdebug && \
    pecl install imagick && \
    docker-php-ext-enable imagick && \
    docker-php-ext-install gd && \
    docker-php-ext-enable opcache && \
    apk del build-base \
    linux-headers \
    libaio-dev \
    && rm -rf /var/cache/apk/*
ADD https://raw.githubusercontent.com/renatomefi/php-fpm-healthcheck/master/php-fpm-healthcheck /usr/local/bin/php-fpm-healthcheck 
RUN chmod +x /usr/local/bin/php-fpm-healthcheck

COPY healthy.conf /usr/local/etc/php-fpm.d/healthy.conf

# Register the COMPOSER_HOME environment variable
ENV COMPOSER_HOME /composer

# Add global binary directory to PATH and make sure to re-export it
ENV PATH /composer/vendor/bin:$PATH
ENV FCGI_CONNECT 127.0.0.1:19000
HEALTHCHECK --interval=5s --timeout=1s \
    CMD php-fpm-healthcheck || exit 1

# Allow Composer to be run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN composer global require laravel/installer

VOLUME /var/www
WORKDIR /var/www

CMD php-fpm
