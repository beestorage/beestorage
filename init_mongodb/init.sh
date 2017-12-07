#sleep 5
su --command "mongo --host configdb_r1s1 --port 27019 < /data/init_mongodb/s1_initdb_configserver.json" &
su --command "mongo --host datadb_r1s1 --port 27020 < /data/init_mongodb/s2_initdb_shard1nxxx.json" &
#su --command "mongo --host shard2n1 --port 27020 < /data/s2_initdb_shard2nxxx.json" &
#sleep 20
##su --command "mongos --configdb configserver/config1:27019,config2:27019 --port 27081" &
sleep 40
su --command "mongo --host mongo_router --port 27081 < /data/init_mongodb/s3_initdb_indexkey.json" &
