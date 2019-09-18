FROM circleci/php:7.3
LABEL maintainer="svikramjeet"

RUN  apt-get update \
  && apt-get install -y sudo \
  && apt-get install -y wget

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

FROM circleci/postgres:10
