# image PHP avec Apache
FROM php:8.1.13-apache

# dépendances PHP nécessaires 
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev libzip-dev unzip git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql zip mysqli

# Install Composer
COPY --from=composer:2.6.5 /usr/bin/composer /usr/local/bin/composer

# Verify Composer installation
RUN composer --version

# Set working directory
WORKDIR /var/www/html

# Copier tous les fichiers du projet dans le conteneur
COPY . /var/www/html/

# Debugging steps
RUN which composer
RUN composer --version
RUN ls -l /usr/local/bin
RUN ls -l /var/www/html

# Install project dependencies
RUN composer install

RUN chown -R www-data:www-data /var/www/html

# Exposer le port 80 pour Apache
EXPOSE 80

# Démarrer Apache
CMD ["apache2-foreground"]