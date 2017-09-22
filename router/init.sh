sleep 5
echo 'rs.initiate({"_id":"configserver","configsvr":true,"members":[{"_id":0,"host":"config1:27019"},{"_id":1,"host":"config2:27019"}]})' | mongo --host config1 --port 27019
sleep 10
mongos --configdb configserver/config1:27019,config2:27019 --port 27081 &
sleep 10
echo 'sh.addShard( "shard1:27020")' |mongo --host router1 --port 27081
echo 'sh.addShard( "shard2:27020")' |mongo --host router1 --port 27081
echo 'sh.addShard( "shard3:27020")' |mongo --host router1 --port 27081
echo 'sh.enableSharding("picture")' |mongo --host router1 --port 27081
bash
return 0