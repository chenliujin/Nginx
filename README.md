
# 验证配置是否正确

```
$ nginx -t
```

# 查看编译时的参数
$ nginx -V

# reload
$ nginx -s reload

```
$ systemctl reload nginx
```

# 上传限制

```
    client_header_timeout 120s;        #调大点
    client_body_timeout 120s;          #调大点
    client_max_body_size 25M;
    client_body_buffer_size 256k;

```

# repo
- [官方源](https://www.nginx.com/resources/wiki/start/topics/tutorials/install/)
