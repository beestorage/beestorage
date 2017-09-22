#sleep 5
su --command "mongo --host config1 --port 27019 < /data/initdb_configserver"
sleep 5
su --command "mongos --configdb configserver/config1:27019,config2:27019 --port 27081" &
sleep 10
#su --command "mongo --host router1 --port 27081 < /data/initdb_indexkey" &
/bin/bash