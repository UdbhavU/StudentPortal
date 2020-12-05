from resources.models import Subject
from django.shortcuts import render, redirect
from .models import *
from adminControl.decorators import *
context = {}
day_list = ["Monday", "Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
context["days"] = day_list
context["range"] = range(1,9)
context["classes"] = Cls.objects.all()
context["subjects"] = Subject.objects.all()
# Create your views here.
## id can be Freshman, Sophmore , Senior ,Final
def timetable(request,id):
    timetable = []
    print("ioioioio")
    cls = Cls.objects.get(cls=id)
    k = 0
    if len(Day.objects.filter(cls=cls)) <= 0:
        return redirect('C-Time-Table', id=id)

    for i in day_list:

        day_subs = []
        for j in range(1,9):


            slot = TimeSlot.objects.get(day=Day.objects.get(cls = cls,day_name = i),time = j)
            day_subs.append(Subject.objects.get(pk=slot.subject.pk))

            print(day_subs)
        timetable.append(zip(day_subs,range(1,9)))

        print(len(day_subs))
    context["cls"] = id
    context["timetable"] = zip(timetable,day_list)
    return render(request, "timetable/timetable.html", context)
@is_superuser
def createTimeTable(request,id):
    print("######")
    cls = Cls.objects.get(cls = id)
    print("######")
    if not (cls):
        cls = Cls.objects.create(cls = id)
        cls.save()

    print("######")
    # if Day.objects.filter(cls = cls).exists():
    #     return redirect('Home')
    if request.method == "POST":
        for i in day_list:
            day = Day.objects.create(cls = cls, day_name= i)
            day.save()

            for j in range(1,9):
                # print(str(request.method.POST.get(f"slot{i}{j}")))
                htmlId = request.POST.get("slot"+i+str(j))
                if htmlId == "--Yet-to-be-decided--":
                    subject = Subject.objects.get(subjectName='None')
                    slot = TimeSlot.objects.create(subject=subject, day=day, time=j)
                    slot.save()
                else:
                    subject = Subject.objects.get(subjectName=htmlId)
                    slot = TimeSlot.objects.create(subject=subject,day= day,time = j)
                    slot.save()

    return render(request,'timetable/createTimetable.html',context)

@is_superuser
def editTimeTable(request,id):
    timetable = []
    print("ioioioio")
    cls = Cls.objects.get(cls=id)
    k = 0
    for i in day_list:

        day_subs = []
        for j in range(1,9):

            slot = TimeSlot.objects.get(day=Day.objects.get(cls = cls,day_name = i),time = j)
            day_subs.append(Subject.objects.get(pk=slot.subject.pk))

            print(day_subs)
        timetable.append(zip(day_subs,range(1,9)))

        print(len(day_subs))
    context["timetable"] = zip(timetable,day_list)
    if not (Cls.objects.filter(cls = id).exists()):
        return redirect('Home')

    if request.method == "POST":
        for i in day_list:

            for j in range(1,9):
                day = Day.objects.get(cls=cls, day_name=i)
                # print(str(request.method.POST.get(f"slot{i}{j}")))
                htmlId = request.POST.get("slot"+i+str(j))
                print(htmlId)
                if htmlId == "--Yet-to-be-decided--":
                    subject = Subject.objects.get(id=7)
                    slot = TimeSlot.objects.get(day=day, time=j)
                    slot.subject = subject
                    slot.save()
                    print("hahahahah")
                    continue
                else:
                    subject = Subject.objects.get(subjectName=htmlId)
                    slot = TimeSlot.objects.get(day= day,time = j)
                    slot.subject = subject
                    slot.save()
    return render(request,'timetable/editTimetable.html',context)