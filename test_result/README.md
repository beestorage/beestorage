# Jmeter3.3 r1808647 Test thumbor
## Important before run "Upload Test" for upload image and "GetHttp" for test get image.  
### I'm Design do not run 2 work at the same time. Use right click Enable or Disable at "Upload Test" or "GetHttp"
---
### Important before run "Upload Test"
"Upload test" have 2 config parameter.  
1. "Upload Test" >> "CSV List filename"  
2. "Upload Test" >> "Http Request" >> "BeanShell PostProcessor"
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
### Important before run "GetHttp"  
"GetHttp" have 1 config parameter.  
1. "GetHttp" >> "CSV Files on Server" config file part result "fn_result2.csv" from after run "Upload Test"  
Example data in "fn_result2.csv" after run "Upload Test"  
```
5d525ba6ba694af79fc0378e61cf6eb1
7213332953534d7c877e3945547a8bcc
68b2822881014edebf994e117d6b5f21
```
