# Thumbor Mongo Sharding Compose  
[![alt text](https://preview.ibb.co/nkiT9Q/indock_newmodel.png)](https://ibb.co/bxaapQ)  
### For windows before `git clone` Use  

First docker for me....

```
git config --global core.autocrlf false
git config --global core.eol lf
git clone https://github.com/lionants02/ThumborMongoShardingCompose.git -b BalanceNginxAndNewModel
```
---
#### Default git setting before Use ^^^^^^
```
git config --global core.autocrlf true
git config --global core.eol crlf
```
---
#### How to basic use  
Auto init script.....  
How to use thumbor https://thumbor.readthedocs.io/en/latest/index.html
### important host localhost:7000
---
### Port map.
```
  router1   localhost:27081
  shard1n1  localhost:8001
  shard1n2  localhost:8002
  shard2n1  localhost:8003
  shard2n2  localhost:8004
```
---
#### Reference
> [Base thumbor docker](https://github.com/APSL/docker-thumbor)  
> [Base thumbor source code](https://github.com/thumbor/thumbor)  
> [My docker thumbor compatible Mongo3.4 GridFS](https://github.com/lionants02/ThumborMongoDocker)  
> [Mongo doc shard deploy](https://docs.mongodb.com/manual/tutorial/deploy-shard-cluster/)  
