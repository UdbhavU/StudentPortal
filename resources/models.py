from django.db import models

# Create your models here.
class Subject(models.Model):
    subjectName = models.CharField(max_length=100)
    subjectCode = models.CharField(max_length=20)
    class Meta:
        ordering = ("subjectCode",)

class Resource(models.Model):
    resourceTitle = models.CharField(max_length=100)
    subject = models.ForeignKey(Subject,on_delete=models.CASCADE)
    url = models.URLField(default=None)
    content = models.TextField()
    class Meta:
        ordering = ("subject",)


