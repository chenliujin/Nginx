
- proxy_store
- proxy_cache


# proxy
```
    location / {
            proxy_set_header Host $host;
            proxy_set_header X-Forwarded-For $remote_addr;
            proxy_pass http://127.0.0.1:30080;
    }
```


# backend 
```

    set_real_ip_from    0.0.0.0/0;
    real_ip_header      X-Forwarded-For;
    real_ip_recursive   on;
```
