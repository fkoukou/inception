FROM debian:bullsyes

RUN apt update && apt upgrade -y &&\
    apt install -y ngnix openssl &&\
    apt clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/ngnix/ssl;



RUN openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=MA/ST=Benguerir/L=Benguerir/O=42/OU=1337/CN=localhost"
