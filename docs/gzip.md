# gzip

默认值：gzip off

# gzip_comp_level 

默认值: gzip_comp_level 1


# gzip_types: 压缩类型
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

默认值：gzip_types text/html

```
gzip on;
gzip_http_version 1.1;
gzip_comp_level 4;
gzip_types text/plain text/html text/javascript text/css application/json application/x-javascript text/xml application/xml application/xml+rss;
```
