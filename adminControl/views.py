from typing import Dict, Any


from django.shortcuts import render, redirect, Http404
from .models import Announcement
from resources.models import Subject , Resource
from django.contrib.auth.models import User
context: Dict[Any, Any] = {}
context["subjects"] = Subject.objects.all()
# Create your views here.
def announcement(request):
    if request.user.is_superuser:
        if request.method == "POST":
            a_author = User.objects.get(pk=request.user.id)
            a_content = request.POST.get("a_content")
            a_tags = request.POST.get("a_tag")
            a_title = request.POST.get("a_title")
            a_obj = Announcement.objects.create(title=a_title,author=a_author,content=a_content,tag=a_tags)
            a_obj.save()
            return redirect('Home')
    else:
        context["error"] = "You are not an Admin"

    return render(request, 'adminControl/adminControlPage.html', context)

def editAnnouncement(request, id):
    if request.method == "POST" :
        announcement = Announcement.objects.get(pk=id)
        announcement.title = request.POST.get("a_title")
        announcement.content =request.POST.get("a_content")
        announcement.tag = request.POST.get("a_tag")
        announcement.save()
        return redirect('Home')
    else:
        ancmt = Announcement.objects.get(pk=id)
        context["ancmt"]= ancmt
        return render(request, 'adminControl/editAnnouncement.html', context)

def createResource(request):
    if request.method =="POST":
        subject = Subject.objects.get(subjectCode=request.POST.get("r_sub"))
        r_title = request.POST.get("r_title")
        r_url = request.POST.get("r_url")
        r_content = request.POST.get("r_content")
        resource = Resource.objects.create(resourceTitle=r_title,url=r_url,content=r_content,subject=subject)
        resource.save()
    return redirect('Home')

def userList(request):
    if request.user.is_superuser:
        context["userList"] = User.objects.all()
        return render(request,'adminControl/users.html',context)
    else:
        raise Http404("You are not authorized to access this page")