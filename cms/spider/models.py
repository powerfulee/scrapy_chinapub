# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
class Spider(models.Model):
    start_urls = models.CharField("网站url", max_length=255, blank=True, null=True)

    class Meta:
        db_table = 'spider'