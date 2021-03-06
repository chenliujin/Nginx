# default

```
    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';
```



# 格式定义

使用 | 分隔日志内容，方便以后对日志进行分析和统计。

```
http {
    log_format main '$remote_addr|$remote_user|$time_local|"$request"|'
                    '$status|$request_time|$body_bytes_sent|"$http_referer"|'
                    '"$http_user_agent"|"$http_x_forwarded_for"|'
                    '$upstream_addr|$upstream_status|$upstream_response_time|$connection';
    access_log /var/log/nginx/www.example.com.access.log main;
    ...
}
```

# JSON

```
log_format logJson '{
                         "@timestamp": "$time_local", '
                         '"@fields": { '
                         '"remote_addr": "$remote_addr", '
                         '"remote_user": "$remote_user", '
                         '"body_bytes_sent": "$body_bytes_sent", '
                         '"request_time": "$request_time", '
                         '"status": "$status", '
                         '"request": "$request", '
                         '"request_method": "$request_method", '
                         '"http_referrer": "$http_referer", '
                         '"body_bytes_sent":"$body_bytes_sent", '
                         '"http_x_forwarded_for": "$http_x_forwarded_for", '
                         '"http_user_agent": "$http_user_agent" }
                         }';
```

## 格式说明
* $remote_addr: 客户端 IP
* $remote_user: 已经经过 Auth Basic Module 验证的用户名
* $time_local: 访问时间和时区
* $request: 请求页面地址
* $status: http status(200/304/404)
* $body_bytes_sent: 发送给客户端的字节数，不包括响应头的大小
* $http_referer
* $http_user_agent
* $http_x_forwarded_for: 代理 IP
* $request_time: 请求处理时间，单位为秒，精度毫秒； 从读入客户端的第一个字节开始，直到把最后一个字符发送给客户端后进行日志写入为止。
* $upstream_addr: upstream 地址
* $connection: 连接的序列号
* $upstream_status: upstream 状态
* $upstream_response_time: upstream 响应时间
* $bytes_sent: 发送给客户端的总字节数
* $msec: 日志写入时间
* $log_cookie_id
* $log_zenid


# 日志处理

- site: /var/log/nginx/<site>.access.log

---

# 参考文献
* http://nginx.org/cn/docs/http/ngx_http_log_module.html
