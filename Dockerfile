FROM php:5.6-apache
RUN apt-get update \
  && apt-get install -y zlib1g-dev libpng12-dev libjpeg-dev \
  && docker-php-ext-configure gd \
    --with-png-dir=/usr \
    --with-jpeg-dir=/usr \
  && docker-php-ext-install gd mysql pdo_mysql mysqli mbstring zip

COPY config/apache2/ /etc/apache2
COPY config/php.ini /usr/local/etc/php/

CMD ["apache2-foreground"]
