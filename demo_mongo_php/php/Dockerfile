FROM php:latest

# Install MongoDB PHP driver
RUN pecl install mongodb && \
    docker-php-ext-enable mongodb

COPY php.ini /usr/local/etc/php/


# Copy PHP file to web root
COPY index.php /var/www/html/

# Expose port 80 for Apache
EXPOSE 80