
- proxy_store
- proxy_cache


# proxy
```
location / {
  proxy_ignore_client_abort on; # 阿里云代理到腾讯云时会出现 http 499 
  proxy_http_version 1.1; # Default 1.0
  proxy_set_header Connection ""; # 防止 client 显式设置"close"
  proxy_set_header Host $host;
  proxy_set_header X-Forwarded-For $remote_addr;
  proxy_pass http://127.0.0.1:30080;
}
```

# https
```
    location /api/ {
            proxy_set_header Host $host;
            proxy_set_header X-Forwarded-For $remote_addr;
            proxy_set_header X-Forwarded-Proto https;
            proxy_pass https://127.0.0.1:443/api/;
    }
```

# backend 
```
    set_real_ip_from    0.0.0.0/0;
    real_ip_header      X-Forwarded-For;
    real_ip_recursive   on;
```
