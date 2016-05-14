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

<h2>格式说明</h2>
<ul>
	<li>
            <p><strong>$remote_addr</strong></p>
            <p>客户端 IP</p>
	</li>
	<li>
		<p><strong>$http_x_forwarded_for</strong></p>
		<p>代理 IP</p>
	</li>
	<li>
		<p><strong>$upstream_addr</strong></p>
		<p>upstream 地址</p>
	</li>		
	<li>
		<p><strong>$connection</strong></p>
		<p>连接的序列号</p>
	</li>
	<li>
		<p><strong>$upstream_status</strong></p>
		<p>upstream 状态</p>
	</li>
	<li>
		<p><strong>$time_local</strong></p>
		<p>访问时间和时区</p>
	</li>
	<li>
		<p><strong>$request</strong></p>
		<p>请求页面地址</p>
	</li>
	<li>
		<p><strong>$status</strong></p>
		<p>http status(200/304/404)</p>
	</li>
	<li>
		<p><strong>$body_bytes_sent</strong></p>
		<p>发送给客户端的字节数，不包括响应头的大小</p>
	</li>
	<li>
		<p><strong>$bytes_sent</strong></p>
		<p>发送给客户端的总字节数</p>
	</li>
	<li>
		<p><strong>$http_referer</strong></p>
		<p>referer</p>
	</li>
	<li>
		<p><strong>$http_user_agent</strong></p>
		<p>agent</p>
	</li>
	<li>
		<p><strong>$upstream_response_time</strong></p>
		<p>upstream 响应时间</p>
	</li>
	<li>
		<p><strong>$msec</strong></p>
		<p>日志写入时间</p>
	</li>
	<li>
		<p><strong>$request_time</strong></p>
		<p>请求处理时间，单位为秒，精度毫秒； 从读入客户端的第一个字节开始，直到把最后一个字符发送给客户端后进行日志写入为止。</p>
	</li>
	<li>
		<p><strong>$log_cookie_id</strong></p>
		<p></p>
	</li>
	<li>
		<p><strong>$log_zenid</strong></p>
	</li>		
        <li>$remote_user</li>
</ul>

<h2>参考文献</h2>
<ul>
	<li>http://nginx.org/cn/docs/http/ngx_http_log_module.html</li>
</ul>
