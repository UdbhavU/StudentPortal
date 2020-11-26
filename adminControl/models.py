from django.db import models
from django.contrib.auth.models import User
# Create your models here.
from django.utils import timezone


class Announcement(models.Model):
    title = models.CharField(max_length=200,null=False)
    tag = models.CharField(max_length=300, null=True)
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    content = models.TextField(blank=False)
    publish = models.DateTimeField(default=timezone.now)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    class Meta:
        db_table= "Announcement"
        ordering = ("-publish",)
