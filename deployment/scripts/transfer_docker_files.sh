#!/bin/bash

# Define variables
EC2_USER="ubuntu"
EC2_IP="43.204.39.37"
PEM_FILE="/Users/vasanth/Desktop/SnippTree/assets/snipptree.pem"

# Dockerfile paths on local machine
BROKER_DOCKERFILE="../broker-service/broker-service.dockerfile"
AUTH_DOCKERFILE="../authentication-service/authentication-service.dockerfile"
SNIPPET_DOCKERFILE="../snippet-service/snippet-service.dockerfile"
LOGGER_DOCKERFILE="../logger-service/logger-service.dockerfile"
COMM_DOCKERFILE="../comm-service/comm-service.dockerfile"

# Destination path on EC2
DESTINATION="/home/ubuntu/"

# Transfer Dockerfiles to EC2
echo "Transferring Dockerfiles to EC2 instance..."
scp -i "$PEM_FILE" "$BROKER_DOCKERFILE" "$EC2_USER@$EC2_IP:$DESTINATION"
scp -i "$PEM_FILE" "$AUTH_DOCKERFILE" "$EC2_USER@$EC2_IP:$DESTINATION"
scp -i "$PEM_FILE" "$SNIPPET_DOCKERFILE" "$EC2_USER@$EC2_IP:$DESTINATION"
scp -i "$PEM_FILE" "$LOGGER_DOCKERFILE" "$EC2_USER@$EC2_IP:$DESTINATION"
scp -i "$PEM_FILE" "$COMM_DOCKERFILE" "$EC2_USER@$EC2_IP:$DESTINATION"

# Print success message
echo "Dockerfiles have been successfully transferred to EC2."
