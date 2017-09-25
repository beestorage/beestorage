# Jmeter3.3 r1808647 Test thumbor
---
## Important before run "Upload Test"---  
Upload test have 2 config parameter.  
1. "Test Thumbol" >> "Upload Test" >> "CSV List filename"  
2. "Test Thumbol" >> "Upload Test" >> "Http Request" >> "BeanShell PostProcessor"
---
1. "CSV List filename" is csv list files path for upload.  
Example:
```
G:\Pictures\Wallpaper\2017-04-08-image-10.jpg
G:\Pictures\Wallpaper\HlmWDMU.jpg
G:\Pictures\Wallpaper\IMG_947404.jpg
```
---
2. "BeanShell PostProcessor" config at first line  
`FileWriter fstream = new FileWriter("D:\\temp\\fn_result2.csv",true);`  
Change `D:\\temp\\fn_result2.csv` to you output filename result file.  
thumbor will out put file name is `cf83b552ad3d4bb99fb8dba7f1048733`  

Example data in "fn_result2.csv" after run "Upload Test"  
```
5d525ba6ba694af79fc0378e61cf6eb1
7213332953534d7c877e3945547a8bcc
68b2822881014edebf994e117d6b5f21
```
---
