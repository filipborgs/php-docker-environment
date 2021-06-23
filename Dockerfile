# Chose you php version in docker hub php page
FROM php:7.4-fpm-alpine

# If you want to download the script use this line
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# Or if you want awaredy downloaded use this line
# COPY ./install-php-extensions /usr/local/bin/

# Instaling extensions
RUN chmod +x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions gd pdo_pgsql pgsql bcmath 

# If you want to install composer
RUN install-php-extensions @composer-2.0.2

# Xdebug install if you want
RUN install-php-extensions xdebug-^2.8

WORKDIR /var/www/html