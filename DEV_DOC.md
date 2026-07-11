# Developer Documentation

## Prerequisites

Install the following tools:

- Docker
- Docker Compose


---

## Clone the Repository

```bash
git clone https://github.com/fkoukou/inception.git
cd inception
```

---

## Configuration

Create the `.env` file:

```bash
touch srcs/.env
```

Fill it with all the required environment variables.

---

## Build and Launch

Build the images and start the containers:

```bash
make
```

or

```bash
make up
```

---

## Useful Commands

### Build the images

```bash
docker-compose build
```

### Start the containers

```bash
docker-compose up -d
```

### Stop and remove the containers

```bash
docker-compose down
```

### Display all containers

```bash
docker ps -a
```

### Display Docker images

```bash
docker images
```

### Display Docker volumes

```bash
docker volume ls
```

### Display Docker networks

```bash
docker network ls
```

---

## Persistent Data

### MariaDB data

```text
/home/<login>/data/mariadb
```

### WordPress data

```text
/home/<login>/data/wordpress
```

These directories are mounted as Docker volumes and remain available even after the containers are removed.

---

## Container Management

### Restart a service

```bash
docker-compose restart nginx
docker-compose restart wordpress
docker-compose restart mariadb
```

### Open a shell inside a container

```bash
docker exec -it nginx bash
docker exec -it wordpress bash
docker exec -it mariadb bash
```