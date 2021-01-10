from typing import Dict, Any
from .decorators import is_superuser

from django.shortcuts import render, redirect, Http404
from .models import Announcement
from resources.models import Subject, Resource
from django.contrib.auth.models import User
from timetable.models import Cls
context: Dict[Any, Any] = {}
context["subjects"] = Subject.objects.all()
context["classes"] = Cls.objects.all()
context["title"] = "Admin"


def announcement(request):
    if request.user.is_superuser:
        if request.method == "POST":
            a_author = User.objects.get(pk=request.user.id)
            a_content = request.POST.get("a_content")
            a_tags = request.POST.get("a_tag")
            a_title = request.POST.get("a_title")
            a_obj = Announcement.objects.create(
                title=a_title, author=a_author, content=a_content, tag=a_tags)
            a_obj.save()
            return redirect('Home')
    else:
        context["error"] = "You are not an Admin"

    return render(request, 'adminControl/adminControlPage.html', context)

@is_superuser
def editAnnouncement(request, id):
    if request.method == "POST":
        announcement = Announcement.objects.get(pk=id)
        announcement.title = request.POST.get("a_title")
        announcement.content = request.POST.get("a_content")
        announcement.tag = request.POST.get("a_tag")
        announcement.save()
        return redirect('Home')
    else:
        ancmt = Announcement.objects.get(pk=id)
        context["ancmt"] = ancmt
        return render(request, 'adminControl/editAnnouncement.html', context)

@is_superuser
def createResource(request):
    if request.method == "POST":
        subject = Subject.objects.get(subjectCode=request.POST.get("r_sub"))
        r_title = request.POST.get("r_title")
        r_url = request.POST.get("r_url")
        r_content = request.POST.get("r_content")
        resource = Resource.objects.create(
            resourceTitle=r_title, url=r_url, content=r_content, subject=subject)
        resource.save()
    return redirect('Home')

@is_superuser
def addSubject(request):
        if request.method=="POST":
            sName = request.POST['subjectName']
            sCode = request.POST['subjectCode']
            if Subject.objects.filter(subjectCode=sCode).exists():
                return redirect('ANC')
            else:
                newSubject = Subject.objects.create()
                newSubject.subjectName = sName
                newSubject.subjectCode=sCode
                newSubject.save()
                return redirect('ANC')
        
        else:
            return redirect('ANC')



@is_superuser
def userList(request):
    if request.user.is_superuser:
        # context["userList"] = User.objects.all()
        context["userList"] = User.objects.raw('call `GET_USER`()')
        return render(request, 'adminControl/users.html', context)
    else:
        raise Http404("You are not authorized to access this page")

@is_superuser
def makeAdmin(request, id):
    user = User.objects.get(id=id)
    user.is_superuser = True
    user.save()
    return redirect('USER')
@is_superuser
def removeAdmin(request,id):
    user = User.objects.get(id=id)
    user.is_superuser = False
    user.save()
    return redirect('USER')
@is_superuser
def cTimeTable(request):
    if request.method=="POST":
        className = request.POST['className']
        return redirect('C-Time-Table',id=className)
    else:
        return redirect('ANC')
