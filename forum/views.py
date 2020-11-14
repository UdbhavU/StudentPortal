from django.shortcuts import render ,redirect
from django.http import HttpResponse
from .decorator import user_authenticated 
##--------------models---------------##
from .models import Posts
from django.contrib.auth.models import User
##-----------------------------------##
context={}

#following are list just dummy contents
#when accessing from databse make sure that the content is a list
##done: Access the database content and replace posts with the content from the database
##todo: Proper redirecting measures and a separate view for each post 

#Index/Home page page view
def home(request):
    return render(request,'forum/home.html')

#forum app view
@user_authenticated
def forum(request):
    posts = Posts.objects.all()
    context = {
        'posts':posts
        }
    print(context)
    return render(request,'forum/forum.html', context)
##---------------create_post-----------------##

def createPost(request):
    if request.method =="POST":
        
        user = User.objects.get(username= request.user)
        title = request.POST.get("post_title")
        post_content = request.POST.get("post")
        post = Posts.objects.create(author=user,post_title = title, post_content = post_content )
        post.save()
        forum(request)
    return redirect('Forum-Home')
##-----------------detailed view--------------------##
def viewPost(request,id):
    return render(request, 'forum/viewpost.html')
    
##-----------------edit post------------------------##
def editPost(request, id):
    edited = False
    post = Posts.objects.get(id=id)
    context = {
        'post':post}
    if request.method =="POST":
        if request.user == post.author:
            if not request.POST.get("title") == post.post_title:
                post.post_title = request.POST.get("title")
                edited = True
                print('1')

            if not request.POST.get("content") == post.post_content:
                post.post_content = request.POST.get("content")
                edited=True
                print('2')
            if edited:
                post.save()
            return redirect('Forum-Home')


    return render(request, 'forum/editpost.html',context)

def deletePost(request, id):
    post = Posts.objects.get(pk=id)
    post.delete()
    return redirect('Forum-Home')


    

    
