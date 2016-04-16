* Mozilla/5.0 (Ubuntu; X11; Linux x86_64; rv:8.0) Gecko/20100101 Firefox/8.0
```
if ($http_user_agent ~* "Ubuntu; X11; Linux x86_64;") {
  return 403;
}
```
* Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0

## 参考文献
* [nginx根据http_user_agent防DDOS](http://www.cnblogs.com/top5/archive/2011/01/13/1934845.html)
