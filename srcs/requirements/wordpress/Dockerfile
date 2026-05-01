FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y php php-fpm php-mysql curl wget mariadb-client netcat && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html

COPY conf/wp-config.sh /usr/local/bin/wp-config.sh
RUN chmod +x /usr/local/bin/wp-config.sh

ENTRYPOINT ["/usr/local/bin/wp-config.sh"]
