scrapy分布式爬虫
===
### 技术栈
~~~
python, scrapy, django, xpath, selenium, phantomJS
~~~
![image](https://github.com/powerfulee/scrapy_chinapub/raw/master/public/images/demo1.jpg)
![image](https://github.com/powerfulee/scrapy_chinapub/raw/master/public/images/demo2.jpg)
~~~
### 开发环境
~~~
pyCharm2018.3
scrapy
django
redis
~~~
### 项目组成
~~~
ip_proxies: 代理IP池
spider：分布式爬虫
cms：后台管理系统
### 项目配置
~~~
新建chinapub数据库，执行script目录下chinapub.sql脚本建表及导入数据
安装scrapy框架，安装方法请自行google
~~~
### 项目启动步骤
~~~
1、进入ip_proxies目录，修改settings.py中数据库地址、帐号、密码。执行scrapy crawl ip_proxies，将抓取xicidaili.com网站前三页代理IP。
2、进入spider目录，修改settings.py中数据库信息及redis信息，执行scrapy crawl chinapub，爬虫进入等待状态。然后在redis服务器运行./redis-cli -a password lpush chinapub:start_urls http://www.china-pub.com/命令，将抓取china-pub.com网站书籍。
3、进入cms目录，执行python manage.py runserver 8000命令， 浏览器访问http://localhost:8000/admin，帐号：admin，密码：000000。
~~~
