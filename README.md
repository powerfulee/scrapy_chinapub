scrapy爬虫
===
### 技术栈
~~~
python语言、scrapy框架、xpath
~~~
### 开发环境
~~~
win10
python 2.7.13(兼容3.0)
scrapy 1.5.1
mysql v5.6
chrome浏览器及xPath Helper插件，用于xpath语义分析调试
~~~
### 项目配置
~~~
配置文件：chinapub/settings.py
mysql数据库服务器：填写mysql服务器ip、用户名、密码、数据库名
PROXIES：填写代理IP，代理IP来自http://www.ip3366.net/、http://www.xicidaili.com/wt/
IMAGES_STORE：填写图片下载路径
IMAGES_THUMBS：填写图片缩略图尺寸
~~~
### 项目启动步骤
~~~
1、新建demo数据库，执行script目录中chinapub.sql脚本,建立表结构
2、安装Python及scrapy框架，关于scrapy框架安装方法请自行google
3、进入chinapub目录，运行scrapy crawl chinapub，将抓取http://www.china-pub.com/首页“新书专区”、“预售专区”及每个详情页“系列图书推荐”数据到chinapub表，并下载图片及生成缩略图到本地
~~~