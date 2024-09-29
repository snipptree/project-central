#!/bin/bash

# Define binary names
BROKER_BINARY=brokerApp
AUTH_BINARY=authApp
SNIPPET_BINARY=snippetApp
LOGGER_BINARY=loggerServiceApp
COMM_BINARY=communicationApp
LISTENER_BINARY=listenerApp

# Build broker-service binary
echo "Building broker-service binary..."
cd ../broker-service
env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ${BROKER_BINARY} ./cmd/api

# Build snippet-service binary
echo "Building snippet-service binary..."
cd ../snippet-service
env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ${SNIPPET_BINARY} ./cmd/api

# Build authentication-service binary
echo "Building authentication-service binary..."
cd ../authentication-service
env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ${AUTH_BINARY} ./cmd/api

# Build logger-service binary
echo "Building logger-service binary..."
cd ../logger-service
env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ${LOGGER_BINARY} ./cmd/api

# Build comm-service binary
echo "Building comm-service binary..."
cd ../comm-service
env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ${COMM_BINARY} ./cmd/api

# Optionally, build listener-service binary (if needed)
# echo "Building listener-service binary..."
# cd ../listener-service
# env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ${LISTENER_BINARY} .

echo "Build completed."
