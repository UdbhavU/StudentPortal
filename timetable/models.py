from django.core.validators import MaxValueValidator, MinValueValidator
from django.db import models
from resources.models import Subject
class Cls(models.Model):
    #------choices for class-----------#
    # freshman = "Freshman"
    # sophmore = "Sophmore"
    # senior = "Senior"
    # final = "Final"
    # cls_choice = ((freshman, "Freshman"),(sophmore,"Sophmore"),(senior,"senior"),(final,"Final"))
    #----------------------------------#
    cls = models.CharField(max_length=10)
    # cls = models.CharField(max_length=10, choices=cls_choice, default=freshman)




class Day(models.Model):
    #------Choices for day-------------#
    # mon = "Monday"
    # tue = "Tuesday"
    # wed = "Wednesday"
    # thur = "Thursday"
    # fri = "Friday"
    # sat = "Saturday"
    # sun = "Sunday"
    # choice = (
    # (mon, "Monday"), (tue, "Tuesday"), (wed, "Wednesday"), (thur, "Thursday"), (fri, "Friday"), (sat, "Saturday"),
    # (sun, "Sunday"),)
    #-----------------------------------#
    cls = models.ForeignKey(Cls, on_delete=models.CASCADE)
    day_name = models.CharField(max_length=15)
    # day_name = models.CharField(max_length=15, choices=choice, default=mon)


class TimeSlot(models.Model):
    time =  models.IntegerField(default=1,
        validators=[MaxValueValidator(10), MinValueValidator(1)])
    subject = models.ForeignKey(Subject,on_delete=models.CASCADE)
    day = models.ForeignKey(Day, on_delete=models.CASCADE)





