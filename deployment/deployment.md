Step 1:
    Build Binaries of all Go Microservices.
        - Run sh deployment/scripts/build_binaries.sh
Step 2:
    Run this in EC2 before copying
        - Run sudo rm -rf brokerApp snippetApp authApp loggerServiceApp communicationApp docker-compose.yml 
Step 3:
    Copy all the binaries to EC2 Instance including docker compose file
        - Run sh deployment/scripts/copy_binaries_ec2.sh
Step 4:
    Transfer docker files if changed (ONLY IF DOCKER FILES ARE CHANGED)
        - Run sh deployment/scripts/transfer_docker_files.sh
Step 5:
    SSH into EC2 instance
        - ssh -i /Users/vasanthkorada/Desktop/SnippTree/assets/snipptree.pem ubuntu@43.204.39.37
Step 6: 
    Build and Run Docker in EC2
        - docker-compose down
        - docker-compose up --build -d