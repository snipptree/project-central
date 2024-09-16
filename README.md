# snipptree

## ssh into instance
ssh -i "snipptree.pem" ec2-user@3.6.67.90

## copy project to ec2
scp -r -i "/Users/vasanthkorada/Desktop/SnippTree/assets/snipptree.pem" /Users/vasanthkorada/Desktop/SnippTree/backend/sniptree ec2-user@3.6.67.90:/home/ec2-user/

## set go path on ec2
export PATH=$PATH:/usr/local/go/bin

#ngnix
sudo systemctl start nginx
sudo systemctl status nginx


# Authenticate Docker to AWS ECR:
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 727646499255.dkr.ecr.ap-south-1.amazonaws.com

# Build Docker Images
docker build -t broker-service .
docker build -t snippet-service .
docker build -t authentication-service .

# Tag the Images:
docker tag broker-service:latest 727646499255.dkr.ecr.ap-south-1.amazonaws.com/broker-service:latest
docker tag snippet-service:latest 727646499255.dkr.ecr.ap-south-1.amazonaws.com/snippet-service:latest
docker tag authentication-service:latest 727646499255.dkr.ecr.ap-south-1.amazonaws.com/authentication-service:latest

# Push the Images
docker push 727646499255.dkr.ecr.ap-south-1.amazonaws.com/broker-service:latest
docker push 727646499255.dkr.ecr.ap-south-1.amazonaws.com/snippet-service:latest
docker push 727646499255.dkr.ecr.ap-south-1.amazonaws.com/authentication-service:latest

# Force Kubernetes to pull the latest image:
kubectl get deployments
kubectl rollout restart deployment/<--deployment-name--> (E.G: kubectl rollout restart deployment/snippet-service)
kubectl get pods (to verify pod age)

# Apply Deployments:
kubectl apply -f broker-service-deployment.yaml
kubectl apply -f snippet-service-deployment.yaml
kubectl apply -f authentication-service-deployment.yaml

TCP: 31249

# Ingress Setup
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml


# cert-manager
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.6.1/cert-manager.yaml
kubectl logs -n cert-manager -l app=cert-manager


# Ingress
kubectl get ingress
kubectl apply -f cluster-issuer.yaml
kubectl apply -f ingress.yaml
kubectl describe ingress snipptree-ingress
kubectl describe ingress

# SSL
kubectl describe certificate snipptree-tls

# broker-service loadbalancer ip
a9907755078434bdb88d3a69f6bc030f-451698743.ap-south-1.elb.amazonaws.com.

# scale down eks - drain and delete
kubectl drain <--node-name--> --ignore-daemonsets --delete-emptydir-data
kubectl delete node <--node-name-->
Alternatively, if you’re using an autoscaling group, modify the desired node count to 1.
