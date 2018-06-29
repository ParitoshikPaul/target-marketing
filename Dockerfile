FROM php:7.0.30-apache

RUN a2enmod rewrite

RUN apt-get update \
  && apt-get install -y zlib1g-dev libicu-dev g++ git openssh-client libpng-dev \
  && docker-php-ext-configure intl \
  && docker-php-ext-install intl pdo_mysql zip

RUN pecl install xdebug-2.5.5 && docker-php-ext-enable xdebug
RUN apt-get update && apt-get install -my wget gnupg
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update \
  && apt-get install -y nodejs \
  && apt-get install -y yarn

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
