# Use the official Drupal 10 image with PHP 8.2 FPM
FROM drupal:10-php8.2-fpm-alpine

# Install Nginx
RUN apk add --no-cache nginx

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Set working directory
WORKDIR /var/www/html

# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80

# Start Nginx and PHP-FPM
CMD ["sh", "-c", "nginx -g 'daemon off;' & php-fpm"]

ENV PATH="$PATH:/opt/drupal/web/vendor/bin"
