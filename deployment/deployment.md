Step 1:
    Build Binaries of all Go Microservices.
        - Run sh scripts/build_binaries.sh
Step 2:
    Copy all the binaries to EC2 Instance including docker compose file
        - Run sh scripts/copy_binaries.sh
Step 3:
    Transfer docker files if changed (ONLY IF DOCKER FILES ARE CHANGED)
        - Run sh scripts/transfer_docker_files.sh
Step 4:
    SSH into EC2 instance
        - ssh -i /Users/vasanthkorada/Desktop/SnippTree/assets/snipptree.pem ubuntu@43.204.39.37
Step 5: 
    Build and Run Docker in EC2
        - docker compose down
        - docker compose up --build -d