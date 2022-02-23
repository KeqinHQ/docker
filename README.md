# 克勤 Docker 镜像

克勤内部 Docker 镜像，在官方镜像基础上，根据项目实际情况定制安装了一部分功能。

## PHP

在官方镜像的基础上新增：

- Composer
- Laravel
- Docker healthcheck

### 开启的扩展

bcmath zip bz2 pdo_mysql mysqli simplexml opcache sockets mbstring pcntl xsl pspell gd redis xdebug imagick opcache

### 用法示例

```yaml
php:
    image: keqin/php:8
```

### 版本

[`7,7-fpm,7.4,7.4-fpm`](php/7.4/fpm/Dockerfile)

[`8,8-fpm,8.1,8.1-fpm`](php/8.1/fpm/Dockerfile)

[![PHP 7 Build](https://github.com/KeqinHQ/docker/actions/workflows/php7.yml/badge.svg)](https://github.com/KeqinHQ/docker/actions/workflows/php7.yml)

[![PHP 8 Build](https://github.com/KeqinHQ/docker/actions/workflows/php8.yml/badge.svg)](https://github.com/KeqinHQ/docker/actions/workflows/php8.yml)
