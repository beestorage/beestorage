#sleep 5
su --command "mongo --host config1 --port 27019 < /data/initdb_configserver.json" &
su --command "mongo --host shard1n1 --port 27020 < /data/initdb_shard1nxxx.json" &
su --command "mongo --host shard2n1 --port 27020 < /data/initdb_shard2nxxx.json" &
su --command "mongo --host shard3n1 --port 27020 < /data/initdb_shard3nxxx.json" &
sleep 20
su --command "mongos --configdb configserver/shard1n1:27019,shard1n2:27019,shard2n1:27019,shard2n2:27019,shard3n1:27019,shard3n2:27019 --port 27081" &
sleep 20
su --command "mongo --host router1 --port 27081 < /data/initdb_indexkey.json" &
