FROM debian:bullseye

RUN apt update && \
    apt install -y nginx openssl && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf
COPY tools/initt.sh /

RUN chmod +x /initt.sh

EXPOSE 443

ENTRYPOINT ["/initt.sh"]

