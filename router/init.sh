#sleep 5
su --command "mongo --quiet --host config1 --port 27019 < /data/initdb_configserver" &
sleep 5
su --command "mongos --quiet --configdb configserver/config1:27019,config2:27019 --port 27081" &
sleep 20
su --command "mongo --quiet --host router1 --port 27081 < /data/initdb_indexkey" &