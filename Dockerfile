FROM php:7.3-apache
LABEL maintainer="svikramjeet"

FROM circleci/postgres:10

RUN  apt-get update \
  && apt-get install -y wget