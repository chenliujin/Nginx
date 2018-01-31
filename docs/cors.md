

# axios 跨域配置
- utils/request.js 配置了 config.headers['X-Token']，配置 Access-Control-Allow-Headers 时需加上 X-Token


```
        location / {
                if ($request_method = 'OPTIONS') {
                        add_header Access-Control-Allow-Origin * always;
                        add_header Access-Control-Allow-Credentials true;
                        add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS';
                        add_header 'Access-Control-Allow-Headers' 'X-PINGOTHER,DNT,X-Mx-ReqToken,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,X-Token';
                        return 204;
                }
        }
```



# 参考文献
- [HTTP访问控制（CORS）](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Access_control_CORS)
- [Nginx通过CORS实现跨域](http://www.yunweipai.com/archives/9381.html)
- https://hellowor1d.github.io/2017/07/18/Nginx-%E4%BD%BF%E7%94%A8%E7%AC%94%E8%AE%B0%EF%BC%88%E4%B8%80%EF%BC%89%EF%BC%9A%E8%A7%A3%E5%86%B3%E5%89%8D%E7%AB%AF%E8%B7%A8%E5%9F%9F%E9%97%AE%E9%A2%98/
- http://damon.ghost.io/killing-cors-preflight-requests-on-a-react-spa/
