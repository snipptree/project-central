BROKER_BINARY=brokerApp
AUTH_BINARY=authApp
SNIPPET_BINARY=snippetApp
LOGGER_BINARY=loggerServiceApp
COMM_BINARY=communicationApp

## up: starts all containers in the background without forcing build
up:
	@echo "Starting Docker images..."
	docker compose up -d
	@echo "Docker images started!"

## up_build: stops docker compose (if running), builds all projects and starts docker compose
up_build: build_broker build_auth build_snippet build_logger build_comm
	@echo "Stopping docker images (if running...)"
	docker compose down
	@echo "Building (when required) and starting docker images..."
	docker compose up --build -d
	@echo "Docker images built and started!"

## down: stop docker compose
down:
	@echo "Stopping docker compose..."
	docker compose down
	@echo "Done!"

## build_broker: builds the broker binary as a linux executable
build_broker:
	@echo "Building broker binary..."
	cd ../broker-service && env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ${BROKER_BINARY} ./cmd/api
	@echo "Done!"

build_snippet:	
	@echo "Building snippet binary..."
	cd ../snippet-service && env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ${SNIPPET_BINARY} ./cmd/api
	@echo "Done!"

build_auth:
	@echo "Building auth binary..."
	cd ../authentication-service && env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ${AUTH_BINARY} ./cmd/api
	@echo "Done!"

## build_logger: builds the logger binary as a linux executable
build_logger:
	@echo "Building logger binary..."
	cd ../logger-service && env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ${LOGGER_BINARY} ./cmd/api
	@echo "Done!"

build_comm:
	@echo "Building communication binary..."
	cd ../comm-service && env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ${COMM_BINARY} ./cmd/api
	@echo "Done!"