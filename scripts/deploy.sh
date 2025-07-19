#! bin/bash

# je treba mu dat prava spusteni
# chmod +x config/scripts/deploy.sh     

echo "build docker image"
docker-compose build

echo "promazani stareho kontejneru"
docker-compose down 

echo "spusteni noveho kontejneru"
docker-compose up -d    

echo "spusteni migraci"
docker-compose exec web python manage.py migrate

echo "collectstatic files"
docker-compose exec web python manage.py collectstatic --noinput

echo "hotovo"
echo "navstivte http://localhost:8000 pro zobrazeni aplikace"