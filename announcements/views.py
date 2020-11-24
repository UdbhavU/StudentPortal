from typing import Dict, Any

from django.shortcuts import render, redirect
from .models import Announcement
from django.contrib.auth.models import User
context: Dict[Any, Any] = {}
# Create your views here.
def announcement(request):
    if request.user.is_superuser:
        if request.method == "POST":
            a_author = User.objects.get(pk=request.user.id)
            a_content = request.POST.get("a_content")
            a_obj = Announcement.objects.create(author=a_author,content=a_content)
            a_obj.save()
            return redirect('Home')
    else:
        context["error"] = "You are not an Admin"

    return render(request,'announcements/createAnnouncement.html',context)

def editAnnouncement(request, id):
    if request.method == "POST" :
        announcement = Announcement.objects.get(pk=id)
        announcement.title = request.POST.get("a_title")
        announcement.content =request.POST.get("a_content")
        announcement.tags = request.POST.get("a_tags")
        announcement.save()
        return redirect('Home')
    else:
        ancmt = Announcement.objects.get(pk=id)
        context["ancmt"]= ancmt
        return render(request,'announcements/editAnnouncement.html',context)