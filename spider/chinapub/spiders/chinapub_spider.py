# -*- coding: utf-8 -*
import scrapy
from chinapub.items import ChinapubItem
from scrapy.selector import Selector
from scrapy.http import Request
from scrapy_redis.spiders import RedisSpider

from selenium import webdriver
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By

from itertools import chain

from scrapy.spidermiddlewares.httperror import HttpError
from twisted.internet.error import DNSLookupError
from twisted.internet.error import TimeoutError, TCPTimedOutError

from scrapy import log
import logging

logger = logging.getLogger()
fh = logging.FileHandler('D:\\pythonProject\\chinapub\\chinapub.log')
logger.addHandler(fh)

class ChinapubSpider(RedisSpider):
    name = "chinapub"
    redis_key = 'chinapub:start_urls'
    allow_domains = ["china-pub.com"]
    start_urls = ["http://www.china-pub.com/"]

    def parse(self, response):
        # 新书专区
        node_list1 = response.xpath('//*[@id="ul_top_0"]/li[not(contains(@class,"overflow_h"))]')
        # 预售专区
        node_list2 = response.xpath('//*[@id="ul_top_1"]/li[not(contains(@class,"overflow_h"))]')

        i = 21

        for node in chain(node_list1, node_list2):
            item = ChinapubItem()
            item['detail_src'] = node.xpath('.//div[1]/a/@href').extract_first()

            i = i - 1

            yield Request(item['detail_src'],
                          callback=self.parse_page,
                          meta={'item': item, 'priority': i},
                          priority=i,
                          errback=self.errback_httpbin,
                          dont_filter=True
                          )

    def testing(self, response):
        driver = webdriver.PhantomJS()
        driver.get(response.meta["item"]["detail_src"])

        try:
            category_element = WebDriverWait(driver, 10).until(
                EC.visibility_of_element_located((By.XPATH, '//*[@id="con_a_1"]/div[5]/div[1]'))
            )
            print 'the title element is: %s' % category_element.text.strip()
        finally:
            driver.quit()

    def parse_page(self, response):
        # 获取上层parse方法传递过来的priority优先值
        priority = response.meta["priority"]

        # 获取“购买此商品的人还买了”
        # 因该栏目内容使用js动态生成，所以需使用selenium+phantomJS获取
        driver = webdriver.PhantomJS()
        driver.get(response.meta["item"]["detail_src"])

        # 购买此商品的人还买了
        node_list_1 = driver.find_elements_by_xpath('//*[@id="banner_BoughtAlsoBought2"]/div/ul[@class="left_b_line"]/li[2]/dl/dt/a')

        # 最佳组合
        node_list_2 = driver.find_elements_by_xpath('//*[@id="zhgm_ajax"]/div/div[1]/div[2]/ul/li[1]/a')

        for node in node_list_1:
            item = ChinapubItem()
            detail_src_url = node.get_attribute('href')
            # 获取的url是http://product.china-pub.com/7634822?ref=buyagain，对?后字符串进行截取
            detail_src = detail_src_url[0:detail_src_url.rfind('?')]
            item["detail_src"] = detail_src

            yield Request(item['detail_src'],
                          callback=self.detail_page,
                          meta={'item': item},
                          priority=priority,
                          dont_filter=True
                          )

        # 发送上层获取的详情页地址
        yield Request(response.meta["item"]['detail_src'],
                      callback=self.detail_page,
                      meta={'item': response.meta["item"]},
                      priority=priority,
                      dont_filter=True
                      )

    def detail_page(self, response):
        driver = webdriver.PhantomJS()
        driver.get(response.meta["item"]["detail_src"])

        schedule = ''
        seller_status_url = ''
        try:
            # 缺货商品
            # 断版商品（http://product.china-pub.com/800473）
            seller_node = driver.find_element_by_xpath('//*[@id="right"]/div[1]/div[1]/h1/img[1]')
            seller_status = seller_node.get_attribute('src')

            seller_status_url = seller_status[seller_status.rfind('/') + 1:len(seller_status)]
            status = True
        except:
            # 缺货预定(http://product.china-pub.com/491246)
            logging.log(logging.WARNING, u'缺货预定')
            schedule = Selector(response).xpath('//*[@id="main"]/div[2]/table/tbody/tr/td[2]/div/table/tbody/tr/td[2]/table/tbody/tr/td/div/div/a[2]/text()').extract_first()
            status = False

        if (seller_status_url != 'out_stock.gif' and seller_status_url != 'out_print.gif' and cmp(schedule,'缺货预定') != 0):
            # 等待需抓取的页面元素加载完成并且可见
            image_element = WebDriverWait(driver, 10).until(
                EC.visibility_of_element_located((By.XPATH, '//*[@id="right"]/div[1]/div[1]/div[2]/dl/dt/a/img'))
            )
            title_element = WebDriverWait(driver, 10).until(
                EC.visibility_of_element_located((By.XPATH, '//*[@id="right"]/div[1]/div[1]/h1'))
            )
            orig_price_element = WebDriverWait(driver, 10).until(
                EC.visibility_of_element_located((By.XPATH, '//*[@id="right"]/div[1]/div[2]/ul/li[1]/span'))
            )
            vip_price_element = WebDriverWait(driver, 10).until(
                EC.visibility_of_element_located((By.XPATH, '//*[@class="pro_buy_sen"]'))
            )
            author_element = WebDriverWait(driver, 10).until(
                EC.visibility_of_element_located((By.XPATH, '//*[@id="con_a_1"]/div[1]/ul/li[1]/a/strong'))
            )
            publishing_element = WebDriverWait(driver, 10).until(
                EC.visibility_of_element_located(
                    (By.XPATH, u'//*[@id="con_a_1"]/div[1]/ul/li[contains(text(),"出版社")]/a'))
            )
            ISBN_element = WebDriverWait(driver, 10).until(
                EC.visibility_of_element_located(
                    (By.XPATH, '//*[@id="con_a_1"]/div[1]/ul/li[contains(text(),"ISBN")]/strong'))
            )
            sell_time_element = WebDriverWait(driver, 10).until(
                EC.visibility_of_element_located(
                    (By.XPATH, u'//*[@id="con_a_1"]/div[1]/ul/li[contains(text(),"上架时间")]'))
            )
            publish_time_element = WebDriverWait(driver, 10).until(
                EC.visibility_of_element_located(
                    (By.XPATH, u'//*[@id="con_a_1"]/div[1]/ul/li[contains(text(),"出版日期")]'))
            )
            category_element = WebDriverWait(driver, 10).until(
                EC.visibility_of_element_located((By.XPATH, '//*[@id="con_a_1"]/div[5]/div[1]'))
            )

            item = response.meta["item"]

            detail_url = item["detail_src"]
            book_id = detail_url[detail_url.rfind('/')+1:len(detail_url)]

            item["book_id"] = book_id
            image_url = image_element.get_attribute('src')
            # 对图片地址进行截取获得图片扩展名
            extend_file_name = image_url[image_url.rfind('.'):len(image_url)]

            # 获取的图片地址为http://images.china-pub.com/ebook/8185/cover.jpg，将其替换为http://images.china-pub.com/ebook/8185/shupi.jpg获得大图片地址
            big_image_url = [image_url[0:image_url.rfind('/')+1] + 'shupi' + extend_file_name]

            item["title"] = title_element.text.strip()
            item["image_urls"] = big_image_url
            item["image_file_name"] = book_id + extend_file_name
            item["orig_price"] = orig_price_element.text.strip()
            item["vip_price"] = vip_price_element.text.strip()
            item["author"] = author_element.text.strip()
            item["publishing"] = publishing_element.text.strip()
            item["ISBN"] = ISBN_element.text.strip()

            sell_time = sell_time_element.text.strip()
            item['sell_time'] = sell_time[sell_time.find(':')+6:len(sell_time)]

            publish_time = publish_time_element.text.strip()
            item['publish_time'] = publish_time[publish_time.find(':')+6:len(publish_time)]

            item["category"] = category_element.text.strip()

            return item

    def errback_httpbin(self, failure):
        # log all failures
        self.logger.info(repr(failure))

        # in case you want to do something special for some errors,
        # you may need the failure's type:

        if failure.check(HttpError):
            # these exceptions come from HttpError spider middleware
            # you can get the non-200 response
            response = failure.value.response
            self.logger.info('HttpError错误 on %s', response.url)

        elif failure.check(DNSLookupError):
            # this is the original request
            request = failure.request
            self.logger.info('DNSLookupError错误 on %s', request.url)

        elif failure.check(TimeoutError, TCPTimedOutError):
            request = failure.request
            self.logger.info('TimeoutError错误 on %s', request.url)