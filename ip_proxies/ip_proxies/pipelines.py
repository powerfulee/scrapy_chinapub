# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://doc.scrapy.org/en/latest/topics/item-pipeline.html
import MySQLdb


class IpProxiesPipeline(object):
    def process_item(self, item, spider):
        return item

class CrawlPipeline(object):
    def process_item(self, item, spider):
        mysql_conn = spider.settings.get('MYSQL_CONNECT')
        conn = MySQLdb.connect(**mysql_conn)
        cur = conn.cursor()

        count_sql = "select * from proxies_ip where ip_address='%s'" % item['ip_address']
        cur.execute(count_sql)

        # 判断Ip是否己经存在
        if int(cur.rowcount) < 1:
            sql = ("insert into proxies_ip(ip_address,port,position,http_type,speed,connect_time) values(%s,%s,%s,%s,%s,%s)")
            item_list = (item['ip_address'], item['port'], item['position'], item['http_type'], item['speed'], item['connect_time'])

            try:
                cur.execute(sql, item_list)
            except Exception, e:
                print "Insert error:", e
                conn.rollback()
            else:
                conn.commit()
        else:
            print 'the row is exist'

        cur.close()
        conn.close()

        return item
