from django.shortcuts import render, HttpResponse, redirect
from django.contrib.auth.models import User, auth
from django.contrib.auth import authenticate, login, logout

# Create your views here.
def userlogin(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        print(username,password)
        user = authenticate(request,username=username,password=password)
        print(user)
        if user is not None:
            return render(request,'forum/forum.html')
        else:
             context = {
            'error':'Invalid Username or Password '
        }
        return render(request,'userlogin/signin.html',context)
            
    else:
       return render(request,'userlogin/signin.html')


