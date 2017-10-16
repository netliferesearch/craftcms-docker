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

# Install craft with dependencies into a tmp build folder
RUN composer create-project craftcms/craft /craft-tmp-build -s beta \
  && composer install -d /craft-tmp-build \
  && rm /craft-tmp-build/.env.example

# Add configuration to tmp build folder
ADD ./docker-src/.sample.env /craft-tmp-build/.env
ADD ./docker-src/sample-resources/js/sample.app.js /craft-tmp-build/resources/js/app.js
ADD ./docker-src/sample-resources/scss/sample.style.scss /craft-tmp-build/resources/scss/style.scss
ADD ./docker-src/sample-config/sample.db.php /craft-tmp-build/config/db.php
ADD ./docker-src/sample-config/sample.general.php /craft-tmp-build/config/general.php
ADD ./docker-src/sample-config/sample.memcache.php /craft-tmp-build/config/memcache.php
ADD ./docker-src/sample-templates/sample.index.twig /craft-tmp-build/templates/index.twig
ADD ./docker-src/sample-templates/sample.robots.txt.twig /craft-tmp-build/templates/robots.txt.twig
ADD ./docker-src/install.sh /install.sh
RUN chmod +x /install.sh

EXPOSE 80

CMD ["/install.sh"]
