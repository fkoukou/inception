# User Documentation

## Services

The stack provides the following services:

- NGINX web server
- WordPress website
- MariaDB database

## Starting the Project

```bash
make
```

## Stopping the Project

```bash
make down
```

## Accessing the Website

```text
https://fakoukou.42.fr
```

## Accessing the WordPress Administration Panel

```text
https://fakoukou.42.fr/wp-admin
```

Log in using the administrator credentials defined in the `.env` file.

## Locating Credentials

```text
srcs/.env
```

## Checking Services

### List running containers

```bash
docker ps
```

### View logs for all services

```bash
docker-compose logs
```

### View logs for a specific service

```bash
docker-compose logs nginx
docker-compose logs wordpress
docker-compose logs mariadb
```

## Verifying That the Services Are Running

```bash
docker ps
```

You should see the following containers:

- nginx
- wordpress
- mariadb