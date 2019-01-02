# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from .models import Books

# Register your models here.
class BookAdmin(admin.ModelAdmin):
    list_display = ('book_id', 'title', 'author', 'orig_price', 'vip_price', 'img_url', 'publishing', 'publish_time')
    list_display_links = ('book_id', 'title')
    list_per_page = 15

    def img_url(self, obj):
        return '<a href="%s%s" target="_blank">%s</a>' % ('http://localhost:8000/static/images/full/', obj.image_file_name, obj.image_file_name)

    img_url.allow_tags = True
    img_url.short_description = '图片地址'

admin.site.register(Books, BookAdmin)