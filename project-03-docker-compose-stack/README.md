# Docker Compose: Flask + NGINX

This project demonstrates a real-world Docker Compose stack using:
- Flask app as backend
- NGINX as reverse proxy

## Run

```bash
docker compose up --build -d

docker ps

curl http://localhost:8080

docker compose down

