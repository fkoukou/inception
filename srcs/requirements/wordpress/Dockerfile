FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php \
    php-fpm \
    php-mysql \
    php-curl \
    php-gd \
    php-mbstring \
    php-xml \
    curl \
    wget \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN sed -i 's|listen = /run/php/php.*-fpm.sock|listen = 9000|' \
    /etc/php/7.4/fpm/pool.d/www.conf

WORKDIR /var/www/html

COPY conf/wp-config.sh /usr/local/bin/wp-config.sh
RUN chmod +x /usr/local/bin/wp-config.sh

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/wp-config.sh"]
