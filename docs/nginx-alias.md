## example 1
```
location ~ ^/css/(.*)$ {
    alias /data/www/www.chenliujin.com/laravel/public/css/$1;
}
```

## example 2
```
location ^~ /css/ {
    alias /data/www/www.chenliujin.com/laravel/public/css/;
}
```
