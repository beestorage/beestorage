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

# [สามารถอ่านเพิ่มเติมได้ใน Wiki][wiki-url]


Use front end tcp/8123

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
