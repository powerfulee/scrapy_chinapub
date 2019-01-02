# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class IpProxiesItem(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    pass

class XicidailiItem(scrapy.Item):
    ip_address = scrapy.Field()
    port = scrapy.Field()
    position = scrapy.Field()
    http_type = scrapy.Field()
    speed = scrapy.Field()
    connect_time = scrapy.Field()