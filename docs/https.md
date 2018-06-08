server {
    listen 80;
    server_name www.chenliujin.com;
    rewrite ^(.*)$ https://${server_name}$1 permanent; 
}

server {
  listen 443 ssl;
  server_name www.chenliujin.com;

  ssl_certificate /etc/nginx/ssl/www.chenliujin.com/1_www.chenliujin.com_bundle.crt;
  ssl_certificate_key /etc/nginx/ssl/www.chenliujin.com/2_www.chenliujin.com.key;
  ssl_session_cache shared:SSL:1m;
  ssl_session_timeout 5m;
  ssl_ciphers HIGH:!aNULL:!MD5;
  ssl_prefer_server_ciphers on;
  ssl_protocols TLSv1 TLSv1.1 TLSv1.2;

  charset utf-8;

  gzip on;

  access_log /var/log/nginx/www.chenliujin.com.access.log combined;
  error_log  /var/log/nginx/www.chenliujin.com.error.log;

  location / {
    proxy_set_header Host $host;
    proxy_set_header X-Forwarded-For $remote_addr;
    proxy_pass http://127.0.0.1:8080/;
  }
}

