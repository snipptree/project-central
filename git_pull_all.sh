# !/bin/bash

echo "Updating snipptree project-central..."
git fetch --all
git pull
echo "snipptree project-central updated successfully!"

# List of repositories to update
repos=("broker-service" "snippet-service" "authentication-service" "logger-service" "comm-service")

# Iterate over each repository
for repo in "${repos[@]}"; do
  echo "Updating $repo..."
  
  # Navigate to the repo directory
  cd ../$repo
  
  # Fetch all branches and pull the latest changes
  git fetch --all
  git pull
  
  # Navigate back to the project-central directory
  cd -
  
  echo "$repo updated successfully!"
done

echo "All repositories updated!"