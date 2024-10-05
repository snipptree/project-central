#!/bin/bash

# Define variables
KEY="/Users/vasanth/Desktop/SnippTree/assets/snipptree.pem"
USER="ubuntu"
HOST="43.204.39.37"
DESTINATION="/home/ubuntu/"

# Define the paths for the binaries in their respective folders
FILES=(
    "../broker-service/brokerApp"
    "../snippet-service/snippetApp"
    "../authentication-service/authApp"
    "../logger-service/loggerServiceApp"
    "../comm-service/communicationApp"
    "./docker-compose.yml"
)

# Loop through the files and copy them
for FILE in "${FILES[@]}"; do
    echo "Copying $FILE to $DESTINATION..."
    scp -i "$KEY" "$FILE" "$USER@$HOST:$DESTINATION"
    
    # Check if the last command was successful
    if [ $? -ne 0 ]; then
        echo "Failed to copy $FILE"
        exit 1
    fi
done

echo "All files copied successfully!"
