FROM wyveo/nginx-php-fpm:latest

LABEL author="knut.melvaer@netlife.com"

# Composer - https://hub.docker.com/r/composer/composer/
ENV COMPOSER_VERSION 1.5.1

RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
  && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
  && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }"

RUN php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION} && rm -rf /tmp/composer-setup.php

# Remove existing webroot & re-configure php for Craft & Memcached
RUN rm -rf /usr/share/nginx/app* && \
sed -i -e "s/memory_limit\s*=\s*.*/memory_limit = 256M/g" ${php_conf} && \
sed -i -e "s/session.save_handler\s*=\s*.*/session.save_handler = memcached/g" ${php_conf} && \
sed -i -e "s/;session.save_path\s*=\s*.*/session.save_path = \${MEMCACHED_HOST}:11211/g" ${php_conf}

# Add default craft cms nginx config
ADD ./docker-src/default.conf /etc/nginx/conf.d/default.conf

RUN chown -Rf nginx:nginx /usr/share/nginx

# Add configuration
ADD ./docker-src/.sample.env /.env
ADD ./docker-src/seed-config /seed-config
ADD ./docker-src/install.sh /install.sh
RUN chmod +x /install.sh

EXPOSE 80

CMD ["/install.sh"]