from django.shortcuts import render, redirect

def user_authenticated(view_funct):
    def wrapper(request,*args, **kwargs):
        if request.user.is_authenticated:
            print('decorated')
            return view_funct(request,*args, **kwargs)
        else:
            return redirect('userlogin')
    return wrapper
        