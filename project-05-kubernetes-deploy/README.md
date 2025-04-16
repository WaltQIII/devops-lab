# Kubernetes Deployment with Minikube

This project shows how to deploy a Dockerized Python Flask app on Kubernetes using Minikube.

## What You’ll Learn

- Writing Kubernetes manifests
- Building and pushing Docker images to Minikube
- Deploying and exposing services in Kubernetes

## How to Run

```bash
minikube start --driver=docker
eval $(minikube -p minikube docker-env)
docker build -t k8s-flask-app .
docker build -t wquarles/k8s-flask-app .
docker push wquarles/k8s-flask-app
kubectl apply -f k8s/
minikube service flask-service
kubectl exec -it flask-app-5b84bf949-6nmw7 -- /bin/sh
python -c "import urllib.request; print(urllib.request.urlopen('http://localhost:5000').read())"

