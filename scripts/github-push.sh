#! bin/bash  

# je treba mu dat prava spusteni
# chmod +x config/scripts/github-push.sh

# je treba zadat commit message jako argument
# napr. ./config/scripts/github-push.sh "My commit message"

if [ -z "$1" ]; then
  echo "Usage: $0 <commit-message>"
  exit 1
fi

# github pridani zmene do repozitare
git add .   
git commit -m "$1"
git push origin main    

