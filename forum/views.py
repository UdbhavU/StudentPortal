from django.shortcuts import render
from django.http import HttpResponse
#Index/Home page page view
def home(request):
    return render(request,'forum/base.html')


