from django.http import HttpResponse, Http404
from django.shortcuts import render, redirect
from django.contrib.auth.models import User

from forum.decorator import user_authenticated
from .models import Profiles
from forum.models import Posts
from timetable.models import Cls,Subject

context = {}
context['title'] = "Profile"
context["classes"] = Cls.objects.all()
context["subjects"] = Subject.objects.all()
# Create your views here.
def viewProfile(request, id):
    if request.user == User.objects.get(pk=id) and not Profiles.objects.filter(user=request.user).exists():
        x = Profiles.objects.create(user=request.user)
        x.save()
        return redirect('E-Profile')
    if not Profiles.objects.filter(user=id).exists():
        raise Http404("User is yet to create Profile")
       # return redirect('error.html')

    context["profile"] = Profiles.objects.get(user=id)
    context["posts"] = Posts.objects.filter(author=id)
    return render(request,'profiles/viewProfile.html',context)

@user_authenticated
def editProfile(request):
    context["profile"] = Profiles.objects.get(user=request.user.pk)
    if request.method =="POST":
        profile = Profiles.objects.get(user = request.user.pk)
        profile.bio = request.POST.get('bio')
        profile.course = request.POST.get('course')
        if request.FILES:
            profile.profilePicture = request.FILES.get("picture")
        profile.save()
        return redirect(f"/profile/{request.user.id}/")
    else:
        return render(request,'profiles/editProfile.html',context)

