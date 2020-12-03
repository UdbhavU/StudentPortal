from resources.models import Subject
from django.shortcuts import render, redirect
from .models import *
from adminControl.decorators import *
context ={}
day_list = ["Monday", "Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
context["days"] = day_list
context["range"] = range(1,9)
context["subjects"]= Subject.objects.all()
# Create your views here.
## id can be Freshman, Sophmore , Senior ,Final
def timetable(request,id):
    cls = Day.objects.filter(cls = id)
    timetable = {}
    for i in day_list:
        for j in range(1,9):
            id = "slot"+i+str(j)
            timetable[id]=Subject.objects.get(pk=TimeSlot.objects.get(day=cls.filter(day_name = i)))
    context["timetable"] = timetable



    return render(request, "timetable/timetable.html", context)
@is_superuser
def createTimeTable(request,id):
    cls = Cls.objects.filter(cls = id)
    if (cls.exists()):
        print('shit exists')
        cls = Cls.objects.create(cls = id)
        cls.save()
    if Day.objects.filter(cls = cls).exists():
        return redirect('Home')
    if request.method == "POST":
        for i in day_list:
            day = Day.objects.create(cls = cls, day_name= i)
            day.save()

            for j in range(1,9):
                # print(str(request.method.POST.get(f"slot{i}{j}")))
                htmlId = request.POST.get("slot"+i+str(j))
                if htmlId == "--Yet-to-be-decided--":
                    print("hahahahah")
                    continue
                else:
                    subject = Subject.objects.get(subjectName=htmlId)
                    slot = TimeSlot.objects.create(subject=subject,day= day,time = j)
                    slot.save()

    return render(request,'timetable/createTimetable.html',context)

@is_superuser
def editTimeTable(request,id):
    timetable = {}
    print("ioioioio")
    cls = Cls.objects.get(cls=id)
    for i in day_list:
        for j in range(1,9):
            id = "slot"+i+str(j)
            slot = TimeSlot.objects.get(day=Day.objects.get(cls = cls,day_name = i))
            print(slot.subject)
            timetable[id]=Subject.objects.get(pk= slot.subject)
    context["timetable"] = timetable
    if (Cls.objects.filter(cls = id).exists()):
        return redirect('C-Time-Table')

    if request.method == "POST":
        for i in day_list:
            day = Day.objects.get(cls = cls, day_name= i)
            for j in range(1,9):
                # print(str(request.method.POST.get(f"slot{i}{j}")))
                htmlId = request.POST.get("slot"+i+str(j))
                if htmlId == "--Yet-to-be-decided--":
                    print("hahahahah")
                    continue
                else:
                    subject = Subject.objects.get(subjectName=htmlId)
                    slot = TimeSlot.objects.get(day= day,time = j)
                    slot.subject = subject
                    slot.save()

    return render(request,'timetable/editTimetable.html',context)