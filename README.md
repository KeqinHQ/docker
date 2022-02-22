# 克勤 Docker 镜像

克勤内部 Docker 镜像，在官方镜像基础上，根据项目实际情况定制安装了一部分功能。

## PHP

### 用法示例

```yaml
php:
    image: keqin/php:7
```

### 版本

[`7,7-fpm,7.4,7.4-fpm`](php/7.4/fpm/Dockerfile) [![PHP 7 Build](https://github.com/KeqinHQ/docker/actions/workflows/php7.yml/badge.svg)](https://github.com/KeqinHQ/docker/actions/workflows/php7.yml)
