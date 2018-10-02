#!/bin/bashdgleb

set -evx

export MAPBOX_API_KEY=dg1
 
# start mysql
 
echo "Starting redis & $1 services..."
docker-compose up -d redis mysql adminer
echo "Sleeping for 30s"
# sleep 31
timeout1=31 ; read -t "${timeout1}" -p "Press ENTER or wait $timeout1 seconds..." || true ;  echo ;


# Start Superset
echo "Starting Superset..."
docker-compose up -d superset
if [ "$1" == "celery" ]; then
  echo "Starting Superset worker..."
  docker-compose up -d worker
fi
echo "Sleeping for 30s"
# sleep 33
timeout1=33 ; read -t "${timeout1}" -p "Press ENTER or wait $timeout1 seconds..." || true ;  echo ;

# Inititalize Demo
docker-compose exec superset superset-demo


echo "Navigate to http://localhost:8088 to view demo"
echo -n "Press RETURN to bring down demo"
read down
docker-compose down -v
