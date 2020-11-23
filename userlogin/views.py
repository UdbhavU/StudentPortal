from userlogin.decorator import login_authenticated
from django.shortcuts import render, HttpResponse, redirect
from django.contrib.auth.models import User, auth
from django.contrib.auth import authenticate, login, logout
from . import decorator


# Create your views here.
@login_authenticated
def userlogin(request):
    if request.method == 'POST':
        
        username = request.POST.get('username')
        password = request.POST.get('password')
        print(username,password)
        user = authenticate(request,username=username,password=password)
        print(user)
        if user is not None:
            if user.is_superuser :
                request.admin = 1
            login(request,user)
            # request.session['logged']="True"
            ##debugging purpose->
            print(request.user,'0000')
            return redirect('Forum-Home')
        else:
             context = {
            'error':'Invalid Username or Password '
        }
        return render(request,'userlogin/signin.html',context)
            
    else:
       return render(request,'userlogin/signin.html')


def userlogout(request):
    
    if request.user.is_authenticated:
        request.admin = 0
        logout(request)        
        
    return redirect('Home')