



albe@pmdsdata4:/srv/dkr/394superset_dkr$ dkps
+ docker images
REPOSITORY                 TAG                 IMAGE ID            CREATED             SIZE
394superset_dkr_superset   latest              579f8eacd5e3        5 minutes ago       935MB
redis                      latest              0a153379a539        6 hours ago         83.4MB
adminer                    4.6                 0038b45402de        2 weeks ago         81.7MB
debian                     stretch             f2aae6ff5d89        4 weeks ago         101MB
metabase/metabase          v0.30.0             3ea53572d627        7 weeks ago         248MB
mysql                      5.7.22              6bb891430fb6        2 months ago        372MB
+ docker network ls
NETWORK ID          NAME                      DRIVER              SCOPE
25fb62b8bf8d        394superset_dkr_default   bridge              local
f13540b4ee74        bridge                    bridge              local
8ebe20a09474        host                      host                local
c563957bf7e7        none                      null                local
1c55a1e8d47b        sister external:true      bridge              local
+ docker volume ls
DRIVER              VOLUME NAME
local               394superset_dkr_mysql
local               394superset_dkr_redis
local               41d55f0951f603a027808f7ed965650ad9ab521aec23b96bcd63e37b57224dac
local               7e3d38fc61f4f8d538f1f384db60b15c1363061440a464af9f7eeab87826702d
local               fc7313d1a484b7cd049e2c79e7952c8be4bc6ec5bbc4e2ee4381e526a7ec26a7
+ docker ps -a
CONTAINER ID        IMAGE                       COMMAND                  CREATED             STATUS                   PORTS                    NAMES
97a6ee09016a        394superset_dkr_superset    "gunicorn superset:a…"   5 minutes ago       Up 5 minutes (healthy)   0.0.0.0:6161->8088/tcp   394superset_dkr_superset_1
2e71dd9a7f87        mysql:5.7.22                "docker-entrypoint.s…"   5 minutes ago       Up 5 minutes             3306/tcp                 394superset_dkr_mysql_1
09cc29b13ebc        redis                       "docker-entrypoint.s…"   5 minutes ago       Up 5 minutes             6379/tcp                 394superset_dkr_redis_1
bf1e96dfe41b        metabase/metabase:v0.30.0   "/app/run_metabase.sh"   46 hours ago        Up 46 hours              0.0.0.0:6151->3000/tcp   386dkrmetabase_mb_1
f5db1e7e8537        adminer:4.6                 "entrypoint.sh docke…"   46 hours ago        Up 46 hours              0.0.0.0:6115->8080/tcp   adminer392_adminer_1
453255bbe9f7        mysql:5.7.22                "docker-entrypoint.s…"   46 hours ago        Up 46 hours              0.0.0.0:6112->3306/tcp   backend392_dbm_1
+ docker ps
CONTAINER ID        IMAGE                       COMMAND                  CREATED             STATUS                   PORTS                    NAMES
97a6ee09016a        394superset_dkr_superset    "gunicorn superset:a…"   5 minutes ago       Up 5 minutes (healthy)   0.0.0.0:6161->8088/tcp   394superset_dkr_superset_1
2e71dd9a7f87        mysql:5.7.22                "docker-entrypoint.s…"   5 minutes ago       Up 5 minutes             3306/tcp                 394superset_dkr_mysql_1
09cc29b13ebc        redis                       "docker-entrypoint.s…"   5 minutes ago       Up 5 minutes             6379/tcp                 394superset_dkr_redis_1
bf1e96dfe41b        metabase/metabase:v0.30.0   "/app/run_metabase.sh"   46 hours ago        Up 46 hours              0.0.0.0:6151->3000/tcp   386dkrmetabase_mb_1
f5db1e7e8537        adminer:4.6                 "entrypoint.sh docke…"   46 hours ago        Up 46 hours              0.0.0.0:6115->8080/tcp   adminer392_adminer_1
453255bbe9f7        mysql:5.7.22                "docker-entrypoint.s…"   46 hours ago        Up 46 hours              0.0.0.0:6112->3306/tcp   backend392_dbm_1
+ set +vx
albe@pmdsdata4:/srv/dkr/394superset_dkr$ make init

docker-compose exec superset superset-init

WARNING: The MAPBOX_API_KEY variable is not set. Defaulting to a blank string.
WARNING: Some networks were defined but are not used by any service: sister

OCI runtime exec failed: exec failed: container_linux.go:348: starting container process caused
 "exec: \"superset-init\": executable file not found in $PATH": unknown
make: *** [init] Error 126

albe@pmdsdata4:/srv/dkr/394superset_dkr$


