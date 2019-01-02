# -*- coding: utf-8 -*-
import scrapy
import requests
from ip_proxies.items import XicidailiItem
from scrapy.exceptions import DropItem

class ChinapubSpider(scrapy.Spider):
    name = "ip_proxies"
    allow_domains = ["xicidaili.com"]
    start_urls = ('http://www.xicidaili.com')

    def start_requests(self):
        # 获取前三页url地址
        for i in range(1,3):
            urls = ["http://www.xicidaili.com/wt/%s" % i]
            for url in urls:
                yield scrapy.Request(url, callback=self.parse)

    def parse(self, response):
        node_list = response.xpath('//*[@id="ip_list"]/tr[position()>1]')

        item = XicidailiItem()

        for node in node_list:
            speed_str = node.xpath('.//td[7]/div[@class="bar"]/@title').extract_first()
            speed = speed_str[0:speed_str.find('.')]

            # 获取速度小于1秒的IP
            if int(speed) < 1:
                item = XicidailiItem()

                item['ip_address'] = node.xpath('.//td[2]/text()').extract_first()
                item['port'] = node.xpath('.//td[3]/text()').extract_first()
                item['position'] = node.xpath('.//td[4]/a/text()').extract_first()
                item['http_type'] = node.xpath('.//td[6]/text()').extract_first()
                item['speed'] = node.xpath('.//td[7]/div/@title').extract_first()
                item['connect_time'] = node.xpath('.//td[8]/div/@title').extract_first()

                test_page = "http://www.baidu.com"
                PROXY = "http://" + item['ip_address'] + ":" + item['port']
                proxies = {
                    "HTTP": PROXY
                }
                try:
                    response = requests.get(test_page, timeout=1, proxies=proxies)
                    if response.status_code == 200:
                        yield {
                            'ip_address': item['ip_address'],
                            'port': item['port'],
                            'position': item['position'],
                            'http_type': item['http_type'],
                            'speed': item['speed'],
                            'connect_time': item['connect_time']
                        }
                    else:
                        raise DropItem("Duplicate item found: %s" % item)
                except:
                    print("connect failed!")