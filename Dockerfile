FROM php:7.4-apache

LABEL maintainer="svikramjeet"

RUN  apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y git \
  && apt-get install -y sudo \
  && apt-get install -y exif \
  && apt-get install -y wget \
  && apt-get install apt-transport-https ca-certificates curl software-properties-common gnupg-agent -y \
  && curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -  \
  && apt-key fingerprint 0EBFCD88 \
  && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
  && apt-get update \
  && apt-get install docker-ce docker-ce-cli containerd.io -y \
  && apt-get install -y libpng-dev libpq-dev
  
RUN  apt-get install libzip-dev -y

RUN pecl install redis-5.1.1 \
  && docker-php-ext-enable redis

RUN docker-php-ext-install gd pdo pdo_mysql pdo_pgsql pgsql exif zip sockets bcmath
    
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
RUN composer self-update

RUN composer --version
