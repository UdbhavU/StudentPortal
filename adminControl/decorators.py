from django.shortcuts import render, redirect


def is_superuser(view_funct):
    def wrapper(request, *args, **kwargs):
        if request.user.is_superuser:
            print('decorated')
            return view_funct(request, *args, **kwargs)
        else:
            return redirect('Home')

    return wrapper

