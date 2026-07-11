*This project has been created as part of the 42 curriculum by fakoukou.*

# Inception

## Description

Inception is a system administration project from the 42 curriculum. Its goal is to build a small infrastructure composed of several Docker services working together using Docker Compose.

The infrastructure contains:

- NGINX as a web server;
- WordPress with PHP-FPM;
- MariaDB as the database;
- Docker volumes for data persistence;
- A Docker network for communication between containers.

## Project Architecture

```text
                    ┌──────────────────┐
                    │     Internet     │
                    └────────┬─────────┘
                             │
                         HTTPS 443
                             │
                    ┌────────▼────────┐
                    │      NGINX      │
                    │    Container    │
                    └────────┬────────┘
                             │
                          FastCGI
                             │
                    ┌────────▼────────┐
                    │    WordPress    │
                    │    Container    │
                    └────────┬────────┘
                             │
                           MySQL
                             │
                    ┌────────▼────────┐
                    │     MariaDB     │
                    │    Container    │
                    └─────────────────┘


      ┌───────────────────┐      ┌───────────────────┐
      │ /home/login/data/ │      │ /home/login/data/ │
      │     wordpress     │      │      mariadb      │
      └─────────▲─────────┘      └─────────▲─────────┘
                │                            │
                └──────── Docker Volumes ────┘
```

## Services

### NGINX

- Handles HTTPS connections.
- Acts as the only entry point of the infrastructure.
- Forwards requests to the WordPress container.

### WordPress

- PHP web application.
- Communicates with MariaDB to store and retrieve data.

### MariaDB

- Stores the website data.
- Persists data using a Docker volume.

## Clone the Repository

```bash
git clone https://github.com/fkoukou/inception.git
cd inception
```