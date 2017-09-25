# Thumbor Mongo Sharding Compose  
[![alt text](https://image.ibb.co/jVkN3k/indock_newmodel.png)](https://ibb.co/gXHD9Q)  
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
  -----------------------------------------------------
  nginx                       |   http://localhost:7000
  thumbor1                    |   http://localhost:8000
  -----------------------------------------------------
  router1   data mongo        |   localhost:27081
  -----------------------------------------------------
  Data shard shard1n1 mongo   |   localhost:8001
  Data shard shard1n2 mongo   |   localhost:8002
  Data shard shard2n1 mongo   |   localhost:8003
  Data shard shard2n2 mongo   |   localhost:8004
  Data shard shard3n1 mongo   |   localhost:8005
  Data shard shard3n2 mongo   |   localhost:8006
  -----------------------------------------------------
```
---
#### Reference
> [Base thumbor docker](https://github.com/APSL/docker-thumbor)  
> [Base thumbor source code](https://github.com/thumbor/thumbor)  
> [My docker thumbor compatible Mongo3.4 GridFS](https://github.com/lionants02/ThumborMongoDocker)  
> [Mongo doc shard deploy](https://docs.mongodb.com/manual/tutorial/deploy-shard-cluster/)  
