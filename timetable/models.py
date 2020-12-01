from django.core.validators import MaxValueValidator, MinValueValidator
from django.db import models
from resources.models import Subject



class TimeSlot(models.Model):
    time =  models.IntegerField(default=1,
        validators=[MaxValueValidator(10), MinValueValidator(1)])
    subject = models.ForeignKey(Subject,on_delete=models.CASCADE)

class Day(models.Model):
    mon = "Monday"
    tue = "Tuesday"
    wed = "Wednesday"
    thur = "Thursday"
    fri = "Friday"
    sat = "Saturday"
    sun = "Sunday"
    choice = (
    (mon, "Monday"), (tue, "Tuesday"), (wed, "Wednesday"), (thur, "Thursday"), (fri, "Friday"), (sat, "Saturday"),
    (sun, "Sunday"),)

    day_name = models.CharField(max_length=15,choices=choice, default=mon)
    timeslot = models.ForeignKey(TimeSlot,on_delete=models.CASCADE)

