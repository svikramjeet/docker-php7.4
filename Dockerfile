FROM php:7.3-apache
LABEL maintainer="svikramjeet"

RUN  apt-get update \
  && apt-get install -y sudo \
  && apt-get install -y wget

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

FROM circleci/postgres:10
