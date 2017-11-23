# ใช้เก็บไฟล์ข้อมูล Database
โดยข้อมูลของ Database จะอยู่ภายใน Folder นี้ในแต่ละเครื่อง ต้องแน่ใจว่า Folder นี้อยู่ใน Directory `/mnt/beestorage-swarm/database/`

มีเหตุผลคือ ได้มีการกำหนดที่อยู่นี้ไว้ในตัว config ของ docker

---

#### แต่ละ Directory ใช้เก็บอะไรบ้าง
- **configdb**  เก็บข้อมูล database ของ docker node ที่มีการทำงานเป็น mongo configdb
- **db**  เก็บข้อมูล database ของ docker node ที่มีการทำงานเป็น mongo shard หรือ repplica
- **router**  สำหรับการทำงานของเครื่องที่เป็น mongo router
