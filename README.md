# BeeStorage ฝากรูปง่ายสุดใน 3 โลก  
### สำหรับนักพัฒนา.  
![Alt text](https://image.ibb.co/kyzdOR/Swarm.png "BeeStorage infa")  
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
### Clone และติดตั้งด้วยคำสั่ง
ให้เรา Clone โปรเจคมาแล้วให้ทำการ Deploy ด้วยคำสั่งด้านล่าง  
>สำหรับการใช้งานครั้งแรก รอระบบทำการ กำหนดค่าเริ่มต้นประมาณ 1 นาที

```
$ sudo docker stack deploy -c docker-swarm-dbmongo-compose.yml mongoimg
$ sudo docker stack deploy -c docker-swarm-Front-compose.yml thumapi
```
---
### การใช้งาน
สามารถทดสอบการใช้งานเบื้องต้นได้ด้วย [**postman**][postman-url]



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




Use front end tcp/8123


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
