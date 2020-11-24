from django.db import models
from django.db.models.deletion import CASCADE
from django.utils import timezone
from django.contrib.auth.models import User

class Posts(models.Model):
    post_title = models.CharField(max_length=200,null=False)
    slug = models.SlugField(max_length=250,unique_for_date='publish')
    author = models.ForeignKey(User,on_delete=models.CASCADE,related_name='posts')
    post_content = models.TextField()
    publish = models.DateTimeField(default=timezone.now)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    class Meta:
        ordering = ('-publish',)
    def __str__(self):
        return self.post_title

class Comment(models.Model):
    post = models.ForeignKey(Posts,on_delete=models.CASCADE,related_name='posts')
    comment_author = models.ForeignKey(User,on_delete=models.CASCADE,related_name='Comment_Author')
    comment = models.TextField(null=False)
    publish = models.DateTimeField(default=timezone.now)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    class Meta:
        ordering = ('-publish',)
    # def __str__(self):
    #     return self.comment
# Create your models here.
