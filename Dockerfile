FROM postgres:10

FROM php:7.3-apache
LABEL maintainer="svikramjeet"

RUN  apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y git \
  && apt-get install -y sudo \
  && apt-get install -y exif \
  && apt-get install -y wget \
  && apt-get install -y libpng-dev libpq-dev
  
RUN  apt-get install libzip-dev -y

RUN docker-php-ext-install gd mbstring pdo pdo_mysql pdo_pgsql pgsql exif zip

    
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
