# BeeStorage ฝากรูปง่ายสุดใน 3 โลก  
![Alt text](http://image.ibb.co/cqTD4b/Swarm.png "BeeStorage infa")  
### สำหรับนักพัฒนา.  
สร้างขึ้นมาเพื่อตอบโจทย์สำหรับ นักพัฒนา  
- **BeeStorage** ได้เลือก **[thumbor][thumbor-url]** เป็น front end มีความสามารถในการ **[process filter][thumbor-filter-url]** ผ่านการเรียก function ใน **[URL][thumbor-filter-url]** ได้ในตัว และยังมี **[library support หลายภาษา][thumbor-library-url]**  
- ใช้ **[nginx][nginx-url]** ที่มีความยืดหยุ่นในการจัดการระบบแคช
- ระบบการจัดเก็บไฟล์ หลังบ้านเป็น **[mongodb GridFS][mongo-gridfs-url]** ที่มีความสามารถเด่นเรื่องการ **สเกล** และความคง **ทนต่อระบบล่มได้สูง**
สามารถ เพิ่มขนาดเพิ่มเครื่อง เวลาระบบโต ภายหลังได้
- ระบบทั้งหมดอยู่บน **Docker Swarm** ติดตั้งจัดการได้ง่ายเพียงไม่กี่บรรทัด
---
### ความต้องการของระบบ
**BeeStorage** พัฒนาให้สามารถ **deploy บน Docker Swarm** ซึ่งสามารถจัดการได้ง่ายเพียงไม่กี่บรรทัด ก็สามารถใช้ระบบของเราได้แล้ว เครื่องที่[ติดตั้ง **docker**][docker-install-url] อยู่แล้วก็เพียง[ติดตั้ง **swarm**][docker-swarm-url] เพิ่มเข้าไป หรือ ใช้ผ่าน **[Docker Machine][docker-machine-url]** ได้เหมือนกัน

---

##### จำเป็นต้องใช้ขั้นต่ำ 2 เครื่องใช้ Role ดังนี้

|  เครื่อง     | ชื่อ Role     | หมายเหตุ |
|:---:|:---:|:---|
| เครื่องแรก       | frontend       | เป็น API การใช้งานจะเชื่อมผ่านเครื่องนี้ |
| เครื่องสอง   |  data1 | เครื่อง Database|  

  - **มีรูปแบบการใช้งานคำสั่ง**
  ```
  $ sudo docker node update --label-add mongo.role=frontend hostname_เครื่องแรก
  $ sudo docker node update --label-add mongo.role=data1 hostname_เครื่องสอง
  ```
  - **ตัวอย่าง**
  ```
  $ sudo docker node update --label-add mongo.role=frontend beeserver
  $ sudo docker node update --label-add mongo.role=data1 beedb1
  ```

[**อ่านเพิ่มเติม คลิก**][mongo-label-add-url]




---
### Clone และติดตั้งด้วยคำสั่ง
ให้เรา Clone โปรเจคมาแล้วให้ทำการ Deploy ด้วยคำสั่งด้านล่าง  
>สำหรับการใช้งานครั้งแรก รอระบบทำการ กำหนดค่าเริ่มต้นประมาณ 1 นาที

```
$ sudo docker stack deploy -c compose-swarm-beestorage.yml beestorage
```
---
### ลองใช้งานผ่าน curl และ wget

- ทดสอบ upload รูปผ่าน curl ด้วยคำสั่ง

  ```
  curl -i -H "Content-Type: image/jpeg" -XPOST http://11.0.0.164:9000/image --data-binary "@/mnt/img.jpg"                                               HTTP/1.1 100 (Continue)

  HTTP/1.1 201 Created
  Date: Thu, 07 Dec 2017 04:39:18 GMT
  Content-Length: 0
  Content-Type: text/html; charset=UTF-8
  Location: /image/c4ba387492864969b1e46591698cbc1b/image.jpg
  Server: TornadoServer/4.5.2
  ```

- สามารถทดสอบ download ด้วย wget

  ```
  wget http://11.0.0.164:9000/image/c4ba387492864969b1e46591698cbc1b -O testdownload.jpg
  --2017-12-07 11:40:11--  http://11.0.0.164:9000/image/c4ba387492864969b1e46591698cbc1b
  Connecting to 11.0.0.164:9000... connected.
  HTTP request sent, awaiting response... 200 OK
  Length: 265284 (259K) [image/jpeg]
  Saving to: ‘testdownload.jpg’

  testdownload.jpg                             100%[==============================================================================================>] 259.07K  --.-KB/s    in 0.004s

  2017-12-07 11:40:11 (69.0 MB/s) - ‘testdownload.jpg’ saved [265284/265284]
  ```

หรือสามารถทดสอบด้วย [**postman**][postman-url] ก็ได้

---
[**สามารถอ่านเพิ่มเติมได้ใน Wiki คลิก**][wiki-url]


## License

    MIT License

    Copyright (c) 2017 NECTEC
       National Electronics and Computer Technology Center, Thailand

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.


[![NECTEC](http://www.nectec.or.th/themes/nectec/img/logo.png)](https://www.nectec.or.th)




Use front end tcp/9000


[postman-url]: https://www.getpostman.com/
[thumbor-url]: https://thumbor.readthedocs.io
[thumbor-filter-url]: https://thumbor.readthedocs.io/en/latest/filters.html
[thumbor-library-url]: https://thumbor.readthedocs.io/en/latest/libraries.html?highlight=library
[mongo-gridfs-url]: https://docs.mongodb.com/manual/core/gridfs/#when-to-use-gridfs
[mongo-url]: https://www.mongodb.com/
[mongo-shard-url]: https://docs.mongodb.com/manual/sharding/
[nginx-url]: https://www.nginx.com/
[docker-install-url]: https://docs.docker.com/engine/installation/
[docker-swarm-url]: https://docs.docker.com/engine/swarm/swarm-tutorial/
[docker-machine-url]: https://docs.docker.com/machine/get-started/#create-a-machine
[wiki-url]: https://github.com/beestorage/beestorage-swarm/wiki
[mongo-label-add-url]: https://docs.docker.com/engine/swarm/manage-nodes/#add-or-remove-label-metadata
