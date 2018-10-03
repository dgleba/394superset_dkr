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


# Inititalize or Demo
# docker-compose exec superset superset-demo
#   or
# docker-compose exec superset superset-init
#	
#
if [ -f .demoinitialized ]; then
    #file exists, so don't run this again. exit.
    echo
    echo "init has run before, don't run again."
    echo
    read -t  19 -p "Hit ENTER or wait about ten seconds" ; echo ;
else
    echo "run it... "
    # create file to mark that is has been run. Then don't run it again.
    touch .demoinitialized
    docker-compose exec superset superset-demo
fi


echo "Navigate to http://localhost:6161 to view demo. Sub in your hostname instead of localhost"
