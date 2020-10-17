from django.shortcuts import render
from django.http import HttpResponse

#following are just dummy contents
posts = {
    'title':'title 1',
    'author':'usr 1',
    'content':'hello world',
    'date_created':'Oct-20-2020'
}
#Index/Home page page view
def home(request):
    return render(request,'forum/base.html')

#forum app view
def forum(request):
    context = {
        'posts':posts

    }

    return render(request,'forum/forum.html',context)


