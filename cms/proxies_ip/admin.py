# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from .models import ProxiesIp

# Register your models here.
class ip_list(admin.ModelAdmin):
    list_display = ('ip_address', 'port', 'position', 'http_type', 'speed', 'connect_time')

admin.site.register(ProxiesIp, ip_list)