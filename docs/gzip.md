## gzip_types: 压缩类型
* text/plain
* text/css
* text/xml
* text/javascript
* application/xml
* application/xml+rss
* application/json
* application/javascript: 服务器端处理js文件的mime类型
* application/x-javascript
* application/octet-stream: 代表任意的二进制数据传输
* image/svg+xml

```
gzip on;
gzip_comp_level 4;
gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript;
```
