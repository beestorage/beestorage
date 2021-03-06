# BeeStorage
![BeeStorage](https://image.ibb.co/bFaec6/Bee_Storage_user_view.png)
### เคยเจอปัญหาเหล่านี้หรือไม่
* **ระบบฝากภาพ ยากจังไม่เอาแล้ว**  
* **เซงไม่มี api ไม่มี Library พัฒนาเองทำเองทุกอย่าง**  
* **Server เก็บภาพเต็มอีกแล้วซื้อ HDD เพิ่ม**  

>### ปัญหาเหล่านี้จะหมดไปด้วย BeeStorage
>## BeeStorage ฝากรูป *ขจัดปัญหา*  

### สร้างขึ้นมาเพื่อตอบโจทย์สำหรับ นักพัฒนา  
- **BeeStorage** ได้เลือก **[thumbor][thumbor-url]** เป็น front end มีความสามารถในการ **[process filter][thumbor-filter-url]** ผ่านการเรียก function ใน **[URL][thumbor-filter-url]** ได้ในตัว และยังมี **[library support หลายภาษา][thumbor-library-url]**  
- ระบบการจัดเก็บไฟล์ หลังบ้านเป็น **[mongodb GridFS][mongo-gridfs-url]** ที่มีความสามารถเด่นเรื่องการ **สเกล** และความคง **ทนต่อระบบล่มได้สูง**
สามารถ เพิ่มขนาดเพิ่มเครื่อง เวลาระบบโต ภายหลังได้
- ระบบทั้งหมดอยู่บน **Docker Swarm** ติดตั้งจัดการได้ง่ายเพียงไม่กี่บรรทัด

### รูปแบบการใช้งานที่สะดวก
ตัวอย่างการใช้งานโดยกำหนดให้ BeeStorage ทำการ resize รูปภาพ เป็นขนาด 300x200

```URL
http://BeeStorage-server/unsafe/300x200/smart/43f45345f3f2345432242343223fded
```

## การติดตั้งระบบทั้งหมด
1. Clone sorce code จาก **github**
2. กำหนดสภาวะแวดล้อมของระบบ
3. ติดตั้ง **BeeStorage**
4. การใช้งาน **BeeStorage**

โจทย์การติดตั้ง ให้ทำการติดตั้ง BeeStorage ลงในเครื่อง 2 เครื่อง โดยให้เครื่อง `ubuntu_org1` เป็น เครื่อง api และ `coreosex3` ให้เป็นตัวเก็บข้อมูล
 **โดยที่มีการกำหนดค่า hostname และกำหนดค่า network มาให้อยู่ในวงเดียวกันเรียบร้อยแล้ว**

> BeeStorage สามารถทดสอบ การทำงานโดยใช้เพียงเครื่องเดียวได้ โดยใช้ docker-compose
```shell
$ docker-compose -f beestorage-local.yml up
```

### 1. Clone sorce code จาก github
ทุกเครื่องที่จะทำงานในระบบ BeeStorage จำเป็นต้อง setup ระบบก่อน โดยทำการ clone sorce code จาก github และสั่งการทำงานของ setup_env.sh
ให้ใช้คำสั่ง

```shell
$ sudo git clone https://github.com/beestorage/beestorage-swarm.git /srv/beestorage-swarm/
```
และใช้คำสั่ง
```shell
$ sudo sh /beestorage/setup_env.sh
```


### 2. กำหนดสภาวะแวดล้อมของระบบ  
 2.1 การตั้งค่า swarm  
 2.2 การแป๊ะชื่ออ้างอิง หรือ label ให้กับ swarm node

#### 2.1 การตั้งค่า swarm

ที่เครื่อง **`ubuntu_org1`** ให้ใช้คำสั่ง

```shell
`ubuntu_org1`>$ sudo docker swarm init
```
Output > แต่ละเครื่อง จะได้ไม่เหมือนกัน เราจะใช้คำสั่ง docker swarm join ที่ระบบสร้างขึ้นมาให้เพื่อเป็นกุญแจสำหรับการเพิ่ม node ใหม่
```shell

Swarm initialized: current node (ki9g3q6ibepqruvno33losn9s) is now a manager.

To add a worker to this swarm, run the following command:

  docker swarm join --token SWMTKN-1-4o2nlv5aq8fqkr4fv0w1znz8ykivukyi173xeuu8medzya3j0z-0u7e64mjlb67qup7oie7eb1q5 11.0.0.164:2377  

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.                 
```

ให้ copy คำสั่งที่ใช้สำหรับการเชื่อมต่อ จากคำสั่งด้านบน มาใส่ที่เครื่อง `coreosex3`

```shell
`coreosex3`>$ sudo docker swarm join --token SWMTKN-1-4o2nlv5aq8fqkr4fv0w1znz8ykivukyi173xeuu8medzya3j0z-0u7e64mjlb67qup7oie7eb1q5 11.0.0.164:2377
This node joined a swarm as a worker.

```

#### 2.2 การแป๊ะ label ให้ทำที่เครื่อง `ubuntu_org1`
> เราจะกำหนดชื่อ label ให้กับเครื่อง เพื่อใช้ในการอ้างอิงในระบบของ Docker Swarm

|  hostname     | ให้ใช้ชื่อ     | คำอธิบาย |
|:---:|:---:|:---|
| `ubuntu_org1`       | **frontend**       | **Swarm manager node ทำงานเป็น BeeStorage ** |
| `coreosex3`   |  **data1** | **Swarm worker node ทำงานเป็นเครื่อง Database** |

| Swarm node คืออะไร     | คำอธิบาย     |
| :------------- | :------------- |
| **manager node**       | คือเครื่องที่ทำหน้าที่ในการแบ่งงานให้กับเครื่องที่เป็น worker node โดยปรกติ manager node จะทำหน้าที่เป็นทั้ง mananger และ worker ในเวลาเดียวกัน       |
| **worker node** | คอยรับงานจาก manager node |

#### Software ที่จำเป็น

| Software     | หมายเหตุ     |
| :-------------: | :-------------: |
| docker       | version 13.1 ขึ้นไป       |
| git   | version ล่าสุด  |

  - การแป๊ะ label ในส่วนของ hostname `ubuntu_org1` และ hostname `coreosex3` **ปรับเปลี่ยนตามชื่อเครื่องจริง** นอกจากนั้นก๊อปแป๊ะได้เลย

  ```shell
  `ubuntu_org1`>$ sudo docker node update --label-add mongo.role=frontend `ubuntu_org1`
  `ubuntu_org1`>$ sudo docker node update --label-add mongo.role=data1 `coreosex3`
  ```

[**ศึกษาเพิ่มเติมจากเอกสารของ docker**][mongo-label-add-url]


### 3. ติดตั้ง BeeStorage
คำสั่ง Deploy จะสั่งการทำงานที่เครื่อง `ubuntu_org1` ที่เป็น manager node ด้วคำสั่ง

```shell
`ubuntu_org1`>$ sudo docker stack deploy -c compose-swarm-beestorage.yml beestorage
```

หลัง Deploy ต้องรอ 1 นาที เพื่อให้ระบบจะทำการตรวจสอบ database โดยอัตโนมัติ


### 4. การใช้งาน BeeStorage

- ทดสอบ upload รูปผ่าน curl ด้วยคำสั่ง

  ```shell
  curl -i -H "Content-Type: image/jpeg" -XPOST http://11.0.0.164:9000/image --data-binary "@/mnt/img.jpg"                                               HTTP/1.1 100 (Continue)

  HTTP/1.1 201 Created
  Date: Thu, 07 Dec 2017 04:39:18 GMT
  Content-Length: 0
  Content-Type: text/html; charset=UTF-8
  Location: /image/c4ba387492864969b1e46591698cbc1b/image.jpg
  Server: TornadoServer/4.5.2
  ```

- สามารถทดสอบ download ด้วย wget

  ```shell
  wget http://11.0.0.164:9000/image/c4ba387492864969b1e46591698cbc1b -O testdownload.jpg
  --2017-12-07 11:40:11--  http://11.0.0.164:9000/image/c4ba387492864969b1e46591698cbc1b
  Connecting to 11.0.0.164:9000... connected.
  HTTP request sent, awaiting response... 200 OK
  Length: 265284 (259K) [image/jpeg]
  Saving to: ‘testdownload.jpg’

  testdownload.jpg                             100%[==============================================================================================>] 259.07K  --.-KB/s    in 0.004s

  2017-12-07 11:40:11 (69.0 MB/s) - ‘testdownload.jpg’ saved [265284/265284]
  ```

## [การใช้งานด้วย Library][thumbor-library-url]


#### [อ่านต่อ หน้าแรก Wiki][wiki-url]

---

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
[wiki-url]: https://github.com/beestorage/beestorage/wiki

[mongo-label-add-url]: https://docs.docker.com/engine/swarm/manage-nodes/#add-or-remove-label-metadata
