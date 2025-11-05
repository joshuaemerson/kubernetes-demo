# Make sure minikube is active by running command 'minikube start'

# Use Bash and exit when an error is encountered
set -e

# Define variables
NAME="kubernetes-demo-api"
USERNAME="joshuaemerson" # docker hub username
IMAGE="$USERNAME/$NAME:latest" # name of the docker image

echo "Building the Docker image..."
docker build -t $IMAGE .

echo "Push the newly created image to Docker Hub..."
docker push $IMAGE

echo "Apply the kubernetes manifests (YAML files)..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Get the kubernetes pods..."
kubectl get pods

echo "Get the kubernetes services..."
kubectl get services

echo "Get the main service..."
kubectl get service $NAME-service

# Run the service using 'minikube service <service-name>'