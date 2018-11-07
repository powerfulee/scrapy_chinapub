# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class ChinapubItem(scrapy.Item):

    book_id = scrapy.Field()
    title = scrapy.Field()
    detail_src = scrapy.Field()
    image_file_name = scrapy.Field()
    image_urls = scrapy.Field()
    images = scrapy.Field()
    orig_price = scrapy.Field()
    vip_price = scrapy.Field()
    author = scrapy.Field()
    publishing = scrapy.Field()
    ISBN = scrapy.Field()
    publish_time = scrapy.Field()
    sell_time = scrapy.Field()
    category = scrapy.Field()

    pass

