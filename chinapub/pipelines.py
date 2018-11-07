# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://doc.scrapy.org/en/latest/topics/item-pipeline.html

from scrapy.pipelines.images import ImagesPipeline
from scrapy.http import Request
from scrapy.exceptions import DropItem
from scrapy import Request
from scrapy import log
import pymysql
import pymysql.cursors
from twisted.enterprise import adbapi

import logging

logger = logging.getLogger()
fh = logging.FileHandler('D:\\pythonProject\\chinapub\\chinapub.log')
logger.addHandler(fh)

class ImgDownloadPipeline(ImagesPipeline):
    default_headers = {
        'accept': 'image/webp,image/*,*/*;q=0.8',
        'accept-encoding': 'gzip, deflate, sdch, br',
        'accept-language': 'zh-CN,zh;q=0.8,en;q=0.6',
        'cookie': 'ordercount=0; cartbooknum=0; yqf_20070320=%7C%7CA100038239/244541798101F7%5E20160630093934-81497/00004/00/%7C%7C%7C; __utmc=268923182; Hm_lvt_c68f8a95996223c018465c5143d0bdea=1539566341,1540009324,1540175789,1540778135; logvistsid=an5poq55dpqoa1455weiaq45; hurl=%2Cw/%3Fchinapub%3Dlinktech%26a_id%3Da100038239%7C244541798101f7%5E20160630093934-81497%7C00004%7C00%7C%2Czt/1210/jsj_ys_121018/jsj_ys_121018.asp%23djsf%2Czt/1210/jsj_ys_121018/jsj_ys_121018.asp%23yszq%2Cp/8053406%2Cw/computers/common/catalog.asp%3Ftype%3D9%26idd%3D8053406%26shuming%3Dpython%25u5b66%25u4e60%25u624b%25u518c%25uff08%25u539f%25u4e66%25u7b2c5%25u7248%25uff09%2Cp/8053407%2Cp/7807274%2Cw/%23top%2Cp/8052129%2Cp/8053408%2Cw/computers/common/catalog.asp%3Ftype%3D9%26idd%3D8053408%26shuming%3Dpytorch%25u673a%25u5668%25u5b66%25u4e60%25u4ece%25u5165%25u95e8%25u5230%25u5b9e%25u6218%2Cp/8053405%2Cw/computers/common/catalog.asp%3Ftype%3D9%26idd%3D8053405%26shuming%3D%25u57fa%25u4e8e%25u590d%25u6742%25u7f51%25u7edc%25u7684%25u673a%25u5668%25u5b66%25u4e60%25u65b9%25u6cd5%2Cp/8053226%2Cp/8052127; CViewProductHistory=8052129%3b%c7%f8%bf%e9%c1%b4%cd%f8%c2%e7%b9%b9%bd%a8%ba%cd%d3%a6%d3%c3%a3%ba%bb%f9%d3%da%b3%ac%bc%b6%d5%cb%b1%beFabric%b5%c4%c9%cc%d2%b5%ca%b5%bc%f9%7c8053408%3bPyTorch%bb%fa%c6%f7%d1%a7%cf%b0%b4%d3%c8%eb%c3%c5%b5%bd%ca%b5%d5%bd%7c8053405%3b%bb%f9%d3%da%b8%b4%d4%d3%cd%f8%c2%e7%b5%c4%bb%fa%c6%f7%d1%a7%cf%b0%b7%bd%b7%a8%7c8053226%3b%ca%d7%cf%af%b2%fa%c6%b7%b9%d92%a3%ba%b4%d3%b0%d7%c1%ec%b5%bd%bd%f0%c1%ec%7c8052127%3bDocker%bc%bc%ca%f5%c8%eb%c3%c5%d3%eb%ca%b5%d5%bd+%b5%da3%b0%e6; Hm_lpvt_c68f8a95996223c018465c5143d0bdea=1541123627; __utma=268923182.1729600528.1511604368.1541123627.1541140638.72; __utmz=268923182.1541140638.72.7.utmcsr=product.china-pub.com|utmccn=(referral)|utmcmd=referral|utmcct=/8053408; __utmb=268923182.1.10.1541140638',
        'referer': 'https://www.douban.com/photos/photo/2370443040/',
        'user-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36',
    }

    def get_media_requests(self, item, info):
        for image_url in item['image_urls']:
            self.default_headers['referer'] = image_url
            yield Request(image_url,
                          meta={'item': item},
                          headers=self.default_headers
                          )

    def item_completed(self, results, item, info):
        image_paths = [x['path'] for ok, x in results if ok]
        if not image_paths:
            raise DropItem("Item contains no images")
        return item

    def file_path(self, request, response=None, info=None):
        item = request.meta['item']

        extend_file_name = request.url[request.url.rfind('.'):len(request.url)]

        return u'full/{0}.{1}'.format(item["book_id"], extend_file_name)

class WebcrawlerScrapyPipeline(object):

    @classmethod
    def from_settings(cls, settings):
        dbargs = dict(
            host=settings['MYSQL_HOST'],
            db=settings['MYSQL_DBNAME'],
            user=settings['MYSQL_USER'],
            passwd=settings['MYSQL_PASSWD'],
            port=settings['MYSQL_PORT'],
            charset='utf8',
            cursorclass=pymysql.cursors.DictCursor,
            use_unicode=True,
        )
        dbpool = adbapi.ConnectionPool('pymysql', **dbargs)
        return cls(dbpool)

    def __init__(self, dbpool):
        self.dbpool = dbpool

    def process_item(self, item, spider):
        d = self.dbpool.runInteraction(self._conditional_insert, item, spider)
        log.msg("-------------------connected-------------------")
        d.addErrback(self._handle_error, item, spider)
        d.addBoth(lambda _: item)
        return d

    def _conditional_insert(self, conn, item, spider):
        log.msg("-------------------insert start-------------------")

        conn.execute("insert into chinapub (book_id, title, orig_price, vip_price, author, image_url, image_file_name, publishing, ISBN, sell_time, publish_time, category) values(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                             (item["book_id"], item['title'], item['orig_price'], item['vip_price'], item["author"], item["image_urls"], item["image_file_name"], item["publishing"], item["ISBN"], item["sell_time"], item["publish_time"], item["category"]))
        log.msg("-------------------一insert end-------------------")

    def _handle_error(self, failue, item, spider):
        print(failue)
