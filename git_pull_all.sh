#!/bin/bash

echo "Updating snipptree project-central..."
git fetch --all
git checkout main  # Ensure we are on the main branch
git pull --rebase
echo "snipptree project-central updated successfully!"

# List of repositories to update
repos=("broker-service" "snippet-service" "authentication-service" "logger-service" "comm-service")

# Iterate over each repository
for repo in "${repos[@]}"; do
  echo "Updating $repo..."
  
  # Navigate to the repo directory
  cd ../$repo
  
  # Fetch all branches
  git fetch --all
  
  # Checkout to the main branch before pulling
  git checkout main
  
  # Pull the latest changes from the remote main branch with rebase
  git pull --rebase origin main
  
  # Navigate back to the project-central directory
  cd -
  
  echo "$repo updated successfully!"
done

echo "All repositories updated!"
