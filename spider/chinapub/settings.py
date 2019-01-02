# -*- coding: utf-8 -*-

# Scrapy settings for chinapub project
#
# For simplicity, this file contains only settings considered important or
# commonly used. You can find more settings consulting the documentation:
#
#     https://doc.scrapy.org/en/latest/topics/settings.html
#     https://doc.scrapy.org/en/latest/topics/downloader-middleware.html
#     https://doc.scrapy.org/en/latest/topics/spider-middleware.html

BOT_NAME = 'chinapub'

SPIDER_MODULES = ['chinapub.spiders']
NEWSPIDER_MODULE = 'chinapub.spiders'

# Crawl responsibly by identifying yourself (and your website) on the user-agent
#USER_AGENT = 'chinapub (+http://www.yourdomain.com)'

# Obey robots.txt rules
ROBOTSTXT_OBEY = True

# Configure maximum concurrent requests performed by Scrapy (default: 16)
#CONCURRENT_REQUESTS = 32

# Configure a delay for requests for the same website (default: 0)
# See https://doc.scrapy.org/en/latest/topics/settings.html#download-delay
# See also autothrottle settings and docs
#DOWNLOAD_DELAY = 3
# The download delay setting will honor only one of:
#CONCURRENT_REQUESTS_PER_DOMAIN = 16
#CONCURRENT_REQUESTS_PER_IP = 16

# Disable cookies (enabled by default)
COOKIES_ENABLED = False
RETRY_ENABLED = False
DOWNLOAD_TIMEOUT = 15

# Disable Telnet Console (enabled by default)
#TELNETCONSOLE_ENABLED = False

# Override the default request headers:
#DEFAULT_REQUEST_HEADERS = {
#   'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
#   'Accept-Language': 'en',
#}

# Enable or disable spider middlewares
# See https://doc.scrapy.org/en/latest/topics/spider-middleware.html
#SPIDER_MIDDLEWARES = {
#    'chinapub.middlewares.ChinapubSpiderMiddleware': 543,
#}

# Enable or disable downloader middlewares
# See https://doc.scrapy.org/en/latest/topics/downloader-middleware.html
DOWNLOADER_MIDDLEWARES = {
    #'chinapub.middlewares.ChinapubDownloaderMiddleware': 543,
    'chinapub.middlewares.RandomUserAgent': 100,
    'chinapub.middlewares.ProxyMiddleware': 200,
}

# Enable or disable extensions
# See https://doc.scrapy.org/en/latest/topics/extensions.html
#EXTENSIONS = {
#    'scrapy.extensions.telnet.TelnetConsole': None,
#}

# Configure item pipelines
# See https://doc.scrapy.org/en/latest/topics/item-pipeline.html
ITEM_PIPELINES = {
    'scrapy_redis.pipelines.RedisPipeline': 200,
    'chinapub.pipelines.WebcrawlerScrapyPipeline': 300,
    'chinapub.pipelines.ImgDownloadPipeline': 410,
}
IMAGES_STORE = 'D:\\pythonProject\\chinapub\\cms\\static\\images'
IMAGES_THUMBS = {
'small':(145,200),
}

# Enable and configure the AutoThrottle extension (disabled by default)
# See https://doc.scrapy.org/en/latest/topics/autothrottle.html
#AUTOTHROTTLE_ENABLED = True
# The initial download delay
#AUTOTHROTTLE_START_DELAY = 5
# The maximum download delay to be set in case of high latencies
#AUTOTHROTTLE_MAX_DELAY = 60
# The average number of requests Scrapy should be sending in parallel to
# each remote server
#AUTOTHROTTLE_TARGET_CONCURRENCY = 1.0
# Enable showing throttling stats for every response received:
#AUTOTHROTTLE_DEBUG = False

# Enable and configure HTTP caching (disabled by default)
# See https://doc.scrapy.org/en/latest/topics/downloader-middleware.html#httpcache-middleware-settings
#HTTPCACHE_ENABLED = True
#HTTPCACHE_EXPIRATION_SECS = 0
#HTTPCACHE_DIR = 'httpcache'
#HTTPCACHE_IGNORE_HTTP_CODES = []
#HTTPCACHE_STORAGE = 'scrapy.extensions.httpcache.FilesystemCacheStorage'

PROXIES = [
    {'ip_port': '113.200.214.164:9999', 'user_pass': ''},
    {'ip_port': '61.135.217.7:80', 'user_pass': ''},
    {'ip_port': '219.246.90.204:3128', 'user_pass': ''},
    {'ip_port': '182.88.89.107:8123', 'user_pass': ''},
    {'ip_port': '183.159.91.31:8010', 'user_pass': ''},
    {'ip_port': '123.185.67.48:8118', 'user_pass': ''},
]

DEFAULT_REQUEST_HEADERS = {
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8',
    'Accept-Encoding': 'gzip, deflate, br',
    'Accept-Language': 'en-US,en;q=0.9,zh-CN;q=0.8,zh;q=0.7',
    'Host': 'product.china-pub.com',
    'Referer': 'http://images.china-pub.com/',
    'X-XHR-Referer': 'http://images.china-pub.com/',
    'Connection': 'keep-alive',
    'Cookie': 'BAIDUID=EBF707CB695FAAD111732AEB998008E7:FG=1; BIDUPSID=EBF707CB695FAAD111732AEB998008E7; PSTM=1511487177; BDUSS=FZOZTdYeW1sYmlKLVlvQ042WGE5R0NVb2dZVjlxRVN0T1k2SHdKOHFNZmw2V05hQVFBQUFBJCQAAAAAAAAAAAEAAAADdO4BcG93ZXJmdWxlZQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOVcPFrlXDxae; BD_UPN=12314753; MCITY=-340%3A; H_PS_PSSID=1435_21101_26350_27244_20927; BDORZ=B490B5EBF6F3CD402E515D22BCDA1598'
}

#mysql数据库服务器
MYSQL_HOST = '192.168.3.40'
MYSQL_DBNAME = 'chinapub'
MYSQL_USER = 'sycf'
MYSQL_PASSWD = '000000'
MYSQL_PORT = 3306

#确保所有的爬虫通过Redis去重
DUPEFILTER_CLASS = "scrapy_redis.dupefilter.RFPDupeFilter"
# 启动从reids缓存读取队列,调度爬虫
SCHEDULER = "scrapy_redis.scheduler.Scheduler"
# 调度状态持久化，不清理redis缓存，允许暂停/启动爬虫
SCHEDULER_PERSIST = True
# 请求调度使用优先队列（默认)
SCHEDULER_QUEUE_CLASS = 'scrapy_redis.queue.SpiderPriorityQueue'

REDIS_HOST = "192.168.3.225"
REDIS_PORT = 6379
REDIS_PARAMS = {
'password': '1989June4'
}

# DOWNLOAD_FAIL_ON_DATALOSS = False