FROM debian:bullseye

RUN apt update && apt upgrade -y && \
    apt install -y nginx openssl && \
    apt clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=MA/ST=Benguerir/L=Benguerir/O=42/OU=1337/CN=localhost"

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/www/html

EXPOSE 443

CMD ["sh", "-c", "nginx -t && nginx -g 'daemon off;'"]
