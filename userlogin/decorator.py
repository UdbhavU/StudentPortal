from django.shortcuts import redirect

def login_authenticated(view_funct):
    def wrapper(request,*args, **kwargs):
        if not request.user.is_authenticated:
            print('decorated')
            return view_funct(request,*args, **kwargs)
        else:
            return redirect('Forum-Home')
    return wrapper