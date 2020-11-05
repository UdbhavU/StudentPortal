from django.db import models
from django.contrib.auth.models import User
from django.db.models.deletion import CASCADE

# Create your models here.
class Profiles(models.Model):
    
    user = models.ForeignKey(User, on_delete=CASCADE)
    profilePicture = models.BinaryField(blank=True)
    bio = models.TextField()
    course = models.CharField(max_length=50)
    class Meta:
        db_table = 'Profiles'
    def __str__(self)->str:
        return self.user



