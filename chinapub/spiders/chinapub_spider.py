# -*- coding: utf-8 -*
import scrapy
from chinapub.items import ChinapubItem
from scrapy.selector import Selector
from scrapy.http import Request

class ChinapubSpider(scrapy.Spider):
    name = "chinapub"
    allow_domains = ["china-pub.com"]
    start_urls = ["http://www.china-pub.com/"]

    def parse(self, response):
        #新书专区
        node_list1 = response.xpath('//*[@id="ul_top_0"]/li[not(contains(@class,"overflow_h"))]')
        #预售专区
        node_list2 = response.xpath('//*[@id="ul_top_1"]/li[not(contains(@class,"overflow_h"))]')

        i = 200
        j = 210

        for node_1, node_2 in zip(node_list1, node_list2):
            item1 = ChinapubItem()
            item1['detail_src'] = node_1.xpath('.//div[1]/a/@href').extract_first()

            item2 = ChinapubItem()
            item2['detail_src'] = node_2.xpath('.//div[1]/a/@href').extract_first()

            i = i - 2
            j = j - 2

            # priority值越大优先级越高
            yield Request(item1['detail_src'],
                          callback=self.parse_page,
                          meta={'item': item1, 'priority': j},
                          priority=j,
                          dont_filter=True
                          )

            yield Request(item2['detail_src'],
                          callback=self.parse_page,
                          meta={'item': item2, 'priority': i},
                          priority=i,
                          dont_filter=True
                          )

    def parse_page(self, response):
        #获取上层parse方法传递过来的priority优先值
        priority = response.meta["priority"]

        #获取系列图书推荐地址
        node_list = response.xpath('//*[@id="left"]/div[5]/ul[@class="left_t_ul"]/li[contains(@style,"display:none")][position()>1]')
        for node in node_list:
            priority = priority - 2

            item = ChinapubItem()
            detail_src_url = node.xpath('.//div/a/@href').extract_first()
            detail_src = detail_src_url[0:detail_src_url.rfind('?')]
            item["detail_src"] = detail_src

            yield Request(item['detail_src'],
                          callback=self.detail_page,
                          meta={'item': item},
                          priority=priority,
                          dont_filter=True
                          )

        #发送上层获取的详情页地址
        yield Request(response.meta["item"]['detail_src'],
                      callback=self.detail_page,
                      meta={'item': response.meta["item"]},
                      priority=priority-2,
                      dont_filter=True
                      )

    def detail_page(self, response):
        item = response.meta["item"]

        detail_url = item["detail_src"]
        book_id = detail_url[detail_url.rfind('/')+1:len(detail_url)]

        item["book_id"] = book_id
        image_url = Selector(response).xpath('//*[@id="right"]/div[1]/div[1]/div[2]/dl/dt/a/img/@src').extract_first()
        extend_file_name = image_url[image_url.rfind('.'):len(image_url)]

        big_image_url = [image_url[0:image_url.rfind('/')+1] + 'shupi' + extend_file_name]

        item["title"] = Selector(response).xpath('//*[@id="right"]/div[1]/div[1]/h1/text()').extract_first().strip()
        item["image_urls"] = big_image_url
        item["image_file_name"] = book_id + extend_file_name
        item["orig_price"] = Selector(response).xpath('//*[@id="right"]/div[1]/div[2]/ul/li[1]/span/text()').extract_first()
        item["vip_price"] = Selector(response).xpath('//*[@class="pro_buy_sen"]/text()').extract_first()
        item["author"] = Selector(response).xpath('//*[@id="con_a_1"]/div[1]/ul/li[1]/a/strong/text()').extract_first()
        item["publishing"] = Selector(response).xpath(u'//*[@id="con_a_1"]/div[1]/ul/li[contains(text(),"出版社")]/a/text()').extract_first()
        item["ISBN"] = Selector(response).xpath('//*[@id="con_a_1"]/div[1]/ul/li[contains(text(),"ISBN")]/strong/text()').extract_first()

        sell_time = Selector(response).xpath(u'//*[@id="con_a_1"]/div[1]/ul/li[contains(text(),"上架时间")]/text()').extract_first()
        item['sell_time'] = sell_time[sell_time.find(':')+6:len(sell_time)]

        publish_time = Selector(response).xpath(u'//*[@id="con_a_1"]/div[1]/ul/li[contains(text(),"出版日期")]/text()').extract_first()
        item['publish_time'] = publish_time[publish_time.find(':')+6:len(publish_time)]

        item["category"] = Selector(response).xpath('//*[@id="con_a_1"]/div[5]/div[1]').extract()

        return item