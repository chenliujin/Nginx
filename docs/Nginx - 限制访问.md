* 多条件判定：根据 $http_user_agent 禁止用户访问指定页 $request。<br />
场景：黑客通过大量肉机尝试破解 wordpress 密码，禁止这些访问。<br />
Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0<br />
Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0
```
set $block 'TRUE';
if ($http_user_agent !~* "Mozilla/5.0 \(Windows NT 6.0; rv:34.0\) Gecko/20100101 Firefox/34.0") {
		set $block 'FALSE';
}
if ($request !~* "wp-login.php") {
		set $block 'FALSE';
}
if ($block = 'TRUE') {
		return 403;
}
```
* $http_user_agent<br />
Mozilla/5.0 (Ubuntu; X11; Linux x86_64; rv:8.0) Gecko/20100101 Firefox/8.0
```
if ($http_user_agent ~* "Ubuntu; X11; Linux x86_64;") {
  return 403;
}
```



[bash]
$ vim /etc/nginx/conf.d/www.chenliujin.com
server {
	# from referer
	if ( $http_referer ~* ^http:\/\/[^\/]*\.qq\.com\/.* ) {
		return 403;
	}

	# from query string
	if ( $args ~* id=110 ) {
		return 403;
	}

	# from user_agent, Wordpress Pingback DDoS attack
	if ( $http_user_agent ~* "WordPress" ) {
        return 403;
	}

    set $log_zenid "";
    if ( $http_cookie ~ "(.*)zenid=([a-z0-9]*);(.*)" ){
        set $log_zenid $2;
    }

  set $tmp_ref $http_referer;
  if ($http_referer = ''){
    set $tmp_ref 'http';
  }
  if ($tmp_ref !~* ^http(.*)$){
        return 403;
  }

  if ($host = 'chenliujin.com') {
    rewrite ^/(.*)$ http://www.chenliujin.com/$1 permanent;
  }

  gzip on;
  gzip_min_length 1024;
  gzip_buffers 8 16k;
  gzip_comp_level 1;
  gzip_http_version 1.1;
  gzip_types text/plain application/x-javascript text/css application/xml application/xml+rss;
  gzip_vary on;


  location ~* \.(ico|gif|jpg|jpeg|png|bmp|swf)(\?[0-9]+)?$ {
    expires 360d;
  }
  #location ~* \.(js|css)(\?[0-9]+)?$ {
    #expires 90d;
  #}
  #location ~ .*\.(htm|html)$ {
    #expires 2h;
  #}

  # deny access to .htaccess files, if Apache's document root
  # concurs with nginx's one
  location ~ /\.ht {
    deny  all;
  }

  error_page  404              /index.php?main_page=site_not_found;
}
[/bash]

## 参考文献
* [nginx根据http_user_agent防DDOS](http://www.cnblogs.com/top5/archive/2011/01/13/1934845.html)
