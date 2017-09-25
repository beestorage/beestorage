# Thumbor Mongo Sharding Compose  
### For windows before `git clone` Use  

First docker for me....

```
git config --global core.autocrlf false
git config --global core.eol lf
git clone https://github.com/lionants02/ThumborMongoShardingCompose.git -b TestConfigInMemoryStorage
```
---
#### Default git setting before Use ^^^^^^
```
git config --global core.autocrlf true
git config --global core.eol crlf
```
---
#### How to basic use  
https://youtu.be/HVWybJD48C8  
[![IMAGE ALT TEXT](http://img.youtube.com/vi/HVWybJD48C8/0.jpg)](https://youtu.be/HVWybJD48C8 "How to basic use... ")
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
![Alt text](https://preview.ibb.co/bYcn15/indock.png "Title")
---
#### Reference
> [Base thumbor docker](https://github.com/APSL/docker-thumbor)  
> [Base thumbor source code](https://github.com/thumbor/thumbor)  
> [My docker thumbor compatible Mongo3.4 GridFS](https://github.com/lionants02/ThumborMongoDocker)  
> [Mongo doc shard deploy](https://docs.mongodb.com/manual/tutorial/deploy-shard-cluster/)  
