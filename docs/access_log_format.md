<h2>格式定义</h2>
<p>使用 | 分隔日志内容，方便以后对日志进行分析和统计。</p>
```
$ vim /etc/nginx/nginx.conf
http {
    log_format main '$remote_addr|$http_x_forwarded_for|$upstream_addr|$connection|$upstream_status|$time_local|$request|$status|$body_bytes_sent|$bytes_sent|$http_referer|$http_user_agent|$upstream_response_time|$msec|$request_time';
    access_log  /var/log/nginx/access.log  main;
    ...
}
```

## 格式说明
* $remote_addr: 客户端 IP
* $http_x_forwarded_for: 代理 IP
* $upstream_addr: upstream 地址
* $connection: 连接的序列号
* $upstream_status: upstream 状态
* $time_local: 访问时间和时区
* $request: 请求页面地址
* $status: http status(200/304/404)
* $body_bytes_sent: 发送给客户端的字节数，不包括响应头的大小
* $bytes_sent: 发送给客户端的总字节数
* $http_referer
* $http_user_agent
* $upstream_response_time: upstream 响应时间
* $msec: 日志写入时间
* $request_time: 请求处理时间，单位为秒，精度毫秒； 从读入客户端的第一个字节开始，直到把最后一个字符发送给客户端后进行日志写入为止。
* $log_cookie_id
* $log_zenid
* $remote_user

## 参考文献
* http://nginx.org/cn/docs/http/ngx_http_log_module.html
