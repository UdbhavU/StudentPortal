from django.shortcuts import render ,redirect
from django.http import HttpResponse
from .decorator import user_authenticated 
##--------------models---------------##
from .models import Posts
from django.contrib.auth.models import User
##-----------------------------------##


#following are list just dummy contents
#when accessing from databse make sure that the content is a list
##todo: Access the database content and replace posts with the content from the database
##todo: Proper redirecting measures and a separate view for each post 
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
@user_authenticated
def forum(request):
    context = {
        'posts':posts
        }
    return render(request,'forum/forum.html', context)
##---------------create_post-----------------##

def createPost(request):
    if request.method =="POST":
        
        user = User.objects.get(username= request.user)
        title = request.POST.get("post_title")
        post_content = request.POST.get("post")
        post = Posts.objects.create(author=user,post_title = title, post_content = post_content )
        post.save()
    return redirect('Forum-Home')


    

    
