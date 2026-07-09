FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    curl \
    mariadb-client \ 
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# mysqlamin mariadb-client

COPY conf/wp-config.sh /wp-config.sh
RUN chmod +x /wp-config.sh

EXPOSE 9000

ENTRYPOINT ["/wp-config.sh"]
