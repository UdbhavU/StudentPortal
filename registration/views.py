from django.shortcuts import render, redirect
from django.contrib.auth.models import User, auth
#[fixed]#TODO: fix the email bug.
#Django gets element by name
# Create your views here.
from resources.models import Subject
from timetable.models import Cls

context={}
context["classes"] = Cls.objects.all()
context["subjects"] = Subject.objects.all()
def signup(request):
    error=[]
    if request.method == 'POST':
        fname = request.POST.get('fname')
        lname = request.POST.get('lname')
        uname = request.POST.get('uname')
        uemail = request.POST.get('userEmail')
        password1 = request.POST.get('password1')
        password2 = request.POST.get('password2')
        if password1==password2:
            if User.objects.filter(username=uname).exists():
                error.append('Username Taken')
                print('*')
            if User.objects.filter(email=uemail).exists():
                error.append('Email taken')
                print('*')
            if len(error)==0:
                user = User.objects.create_user(first_name=fname, last_name=lname, username = uname, password = password1, email = uemail)
                user.save()
                print('*')
                return redirect('/')
            else:
                
                print('*')
                return render(request, 'registration/signupform.html', {'title': 'SignUp', 'error': error})
        else:
            error.append('Different Passwords entered')
            print('*')
            return render(request, 'registration/signupform.html', {'title': 'SignUp', 'error': error})

    else:
        {'title': 'SignUp', 'error': error}
        context['title'] = 'SignUp'
        context["error"] = error
        return render(request,'registration/signupform.html',context)

