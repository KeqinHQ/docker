FROM php:7-fpm-alpine

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
    make \
    unzip \
    ffmpeg \
    wget && \
    docker-php-ext-install bcmath zip bz2 pdo_mysql mysqli simplexml opcache sockets mbstring pcntl xsl pspell && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    pecl install redis && \
    docker-php-ext-enable redis && \
    pecl install imagick && \
    docker-php-ext-enable imagick && \
    docker-php-ext-install gd && \
    docker-php-ext-enable opcache && \
    apk del build-base \
    linux-headers \
    libaio-dev \
    && rm -rf /var/cache/apk/*



# Register the COMPOSER_HOME environment variable
ENV COMPOSER_HOME /composer

# Add global binary directory to PATH and make sure to re-export it
ENV PATH /composer/vendor/bin:$PATH

# Allow Composer to be run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN composer global require laravel/installer

VOLUME /var/www
WORKDIR /var/www

CMD php-fpm