FROM wordpress:php8.1-apache

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Install dependencies for plugins and themes
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    unzip \
    zip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd

# Enable SSL (optional, for dev)
RUN a2enmod ssl
RUN a2ensite default-ssl

# Generate a self-signed certificate
RUN apt-get update && apt-get install -y openssl && \
    mkdir -p /etc/ssl/certs && mkdir -p /etc/ssl/private && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/ssl-cert-snakeoil.key \
    -out /etc/ssl/certs/ssl-cert-snakeoil.pem \
    -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=localhost"

# Enable SSL
RUN a2enmod ssl && a2ensite default-ssl

# Set proper permissions for WordPress
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html