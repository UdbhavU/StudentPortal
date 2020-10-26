from django.shortcuts import render
from django.http import HttpResponse

#following are list just dummy contents
#when accessing from databse make sure that the content is a list
##todo Access the database content and replace posts with the content from the database
posts = [{
     'author':'Percy',
     'title':'welcome',
     'content':'first post',
     'date_posted':'October 15, 2020'
    },
    {
     'author':'Andromeda',
     'title':'welcome again',
     'content':'Second post',
     'date_posted':'October 16, 2020'
    },
    ]
#Index/Home page page view
def home(request):
    return render(request,'forum/home.html')

#forum app view
def forum(request):
    context = {
        'posts':posts

    }

    return render(request,'forum/forum.html',context)
  