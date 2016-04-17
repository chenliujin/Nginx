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