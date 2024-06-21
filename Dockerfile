# Sử dụng hình ảnh PHP chính thức với PHP-FPM
FROM php:8.2-fpm

# Cài đặt các extension PHP cần thiết và các công cụ giải nén
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql gd

# Cài đặt Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Thiết lập thư mục làm việc
WORKDIR /var/www/html

# Sao chép các file composer trước khi chạy composer install
COPY composer.json composer.lock artisan ./

# Thiết lập biến môi trường để cho phép Composer chạy như root
ENV COMPOSER_ALLOW_SUPERUSER=1

# Chạy Composer để cài đặt các package
# RUN composer install --no-dev --optimize-autoloader --no-interaction --prefer-dist

# Sao chép toàn bộ mã nguồn vào container
COPY . .

# Thiết lập quyền cho thư mục storage và bootstrap/cache
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache