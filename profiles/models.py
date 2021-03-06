from django.db import models
from django.contrib.auth.models import User
from django.db.models.deletion import CASCADE

# Create your models here.
class Profiles(models.Model):
    
    user = models.ForeignKey(User, on_delete=CASCADE)
    profilePicture = models.ImageField(upload_to='images/',default=None)
    bio = models.TextField(blank=True)
    course = models.CharField(max_length=50,blank=True)
    class Meta:
        db_table = 'Profiles'
    def __str__(self)->str:
        return self.user
    


