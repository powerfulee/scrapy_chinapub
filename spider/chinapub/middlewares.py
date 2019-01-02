# -*- coding: utf-8 -*-

# Define here the models for your spider middleware
#
# See documentation in:
# https://doc.scrapy.org/en/latest/topics/spider-middleware.html
import pymysql
import pymysql.cursors
import MySQLdb
import MySQLdb.cursors
from twisted.enterprise import adbapi

import requests
import settings

from scrapy import signals

import random
import base64

from settings import PROXIES
from .useragent import USER_AGENTS

class ChinapubSpiderMiddleware(object):
    # Not all methods need to be defined. If a method is not defined,
    # scrapy acts as if the spider middleware does not modify the
    # passed objects.

    @classmethod
    def from_crawler(cls, crawler):
        # This method is used by Scrapy to create your spiders.
        s = cls()
        crawler.signals.connect(s.spider_opened, signal=signals.spider_opened)
        return s

    def process_spider_input(self, response, spider):
        # Called for each response that goes through the spider
        # middleware and into the spider.

        # Should return None or raise an exception.
        return None

    def process_spider_output(self, response, result, spider):
        # Called with the results returned from the Spider, after
        # it has processed the response.

        # Must return an iterable of Request, dict or Item objects.
        for i in result:
            yield i

    def process_spider_exception(self, response, exception, spider):
        # Called when a spider or process_spider_input() method
        # (from other spider middleware) raises an exception.

        # Should return either None or an iterable of Response, dict
        # or Item objects.
        pass

    def process_start_requests(self, start_requests, spider):
        # Called with the start requests of the spider, and works
        # similarly to the process_spider_output() method, except
        # that it doesn’t have a response associated.

        # Must return only requests (not items).
        for r in start_requests:
            yield r

    def spider_opened(self, spider):
        spider.logger.info('Spider opened: %s' % spider.name)


class ChinapubDownloaderMiddleware(object):
    # Not all methods need to be defined. If a method is not defined,
    # scrapy acts as if the downloader middleware does not modify the
    # passed objects.

    @classmethod
    def from_crawler(cls, crawler):
        # This method is used by Scrapy to create your spiders.
        s = cls()
        crawler.signals.connect(s.spider_opened, signal=signals.spider_opened)
        return s

    def process_request(self, request, spider):
        # Called for each request that goes through the downloader
        # middleware.

        # Must either:
        # - return None: continue processing this request
        # - or return a Response object
        # - or return a Request object
        # - or raise IgnoreRequest: process_exception() methods of
        #   installed downloader middleware will be called
        return None

    def process_response(self, request, response, spider):
        # Called with the response returned from the downloader.

        # Must either;
        # - return a Response object
        # - return a Request object
        # - or raise IgnoreRequest
        return response

    def process_exception(self, request, exception, spider):
        # Called when a download handler or a process_request()
        # (from other downloader middleware) raises an exception.

        # Must either:
        # - return None: continue processing this exception
        # - return a Response object: stops process_exception() chain
        # - return a Request object: stops process_exception() chain
        pass

    def spider_opened(self, spider):
        spider.logger.info('Spider opened: %s' % spider.name)

class RandomUserAgent(object):
    def __init__(self, agents):
        self.agents = agents

    @classmethod
    def from_crawler(cls, crawler):
        return cls(USER_AGENTS)

    def process_request(self, request, spider):
        request.headers.setdefault('User-Agent',random.choice(self.agents))
        print u'当前user-agent:',request.headers['User-Agent']

class ProxyMiddleware(object):
    def __init__(self):
        self.connect = pymysql.connect(
            host=settings.MYSQL_HOST,
            db=settings.MYSQL_DBNAME,
            user=settings.MYSQL_USER,
            passwd=settings.MYSQL_PASSWD,
            charset='utf8',
            use_unicode=True
        )
        self.cursor = self.connect.cursor()

    def process_request(self, request, spider):
        proxy = self.get_random_ip()

        request.meta['proxy'] = proxy
        encoded_user_pass = base64.encodestring(' ')
        request.headers['Proxy-Authorization'] = 'Basic ' + encoded_user_pass
        print "**************ProxyMiddleware have pass************"

    def delete_ip(self, ip):
        delete_sql = "delete from proxies_ip where ip_address='{0}'".format(ip)
        self.cursor.execute(delete_sql)
        self.connect.commit()
        return True

    def judge_ip(self, ip, port):
        test_url = "http://www.baidu.com"

        proxy_url = "http://{0}:{1}".format(ip, port)
        print "proxy_url is: %s" % proxy_url
        try:
            proxy_dict = {
                "http":proxy_url
            }
            response = requests.get(test_url, proxies=proxy_dict)
        except Exception as e:
            print ("invalid ip and port")
            self.delete_ip(ip)
            return False
        else:
            code = response.status_code
            if code >= 200 and code < 300:
                print ("effective ip")
                return True
            else:
                print ("invalid ip and port")
                self.delete_ip(ip)
                return False

    def get_random_ip(self):
        random_sql = "SELECT id,ip_address,port,position,http_type,speed,connect_time FROM proxies_ip where http_type='HTTP' ORDER BY RAND() LIMIT 1"
        self.cursor.execute(random_sql)
        result = self.cursor.fetchone()

        ip_address = result[1]
        port = result[2]
        ip_port = ip_address + ":" + port
        print "the ip and port is: %s" % ip_port
        judge_ip = self.judge_ip(ip_address, port)

        if judge_ip:
            return "http://{0}:{1}".format(ip_address, port)
        else:
            self.get_random_ip()