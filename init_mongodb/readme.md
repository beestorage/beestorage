# คำสั่งสำหรับ Config mongo
คำสั่งสำหรับการกำหนดค่า mongo สำหรับการติดตั้งครั้งแรกจะแบ่งเป็น 3 กลุ่ม โดยมีการใช้งานเป็นลำดับ ในครั้งแรก คือ
1. **s1_** ใช้สำหรับกำหนด mongo database ส่วนสำหรับเก็บค่า configuration ของตัว mongodb
2. **s2_** ใช้สำหรับกำหนดระบบ Replica(mongoDB อีกเครื่องที่เก็บข้อมูลเดียวกัน) กับ Shard(mongoDB อีกเครื่องที่แบ่งกันเก็บข้อมูล) ให้กับ mongodb
3. **s3_** ใช้สำหรับกำหนดค่า ให้กับ mongoDB เช่น เพิ่มเครื่องในกลุ่ม s2_ หรือ field ที่จะให้ทำการ shard
---
#### S1 กำหนด configdb


---
#### S2 mongo database replica and shard


---
#### S3 mongodb config shard key


---
