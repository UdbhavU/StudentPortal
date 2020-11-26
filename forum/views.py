from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.core.paginator import Paginator
from adminControl.models import Announcement
from .decorator import user_authenticated
##--------------models---------------##
from .models import Posts
from .models import Comment
from resources.models import Subject
from django.contrib.auth.models import User

##-----------------------------------##
context = {}

subjects = Subject.objects.all()
ancmts = Announcement.objects.all()
context["ancmts"] = ancmts
context["subjects"] = subjects
# following are list just dummy contents
# when accessing from databse make sure that the content is a list
##done: Access the database content and replace posts with the content from the database
##todo: Proper redirecting measures and a separate view for each post 

# Index/Home page page view
def home(request):

    return render(request, 'forum/home.html',context)


# forum app view
@user_authenticated
def forum(request):
    posts = Posts.objects.all()
    context['posts']= posts

    print(context)
    return render(request, 'forum/forum.html', context)


##---------------create_post-----------------##

def createPost(request):
    if request.method == "POST":
        user = User.objects.get(username=request.user)
        title = request.POST.get("post_title")
        post_content = request.POST.get("post")
        post = Posts.objects.create(author=user, post_title=title, post_content=post_content)
        post.save()
        forum(request)
    return redirect('Forum-Home')


##-----------------detailed view--------------------##
def viewPost(request, id):
    post = Posts.objects.get(pk=id)
    context = {
        'post': post,
        'comment': Comment.objects.filter(post=post)
    }
    if request.method == "POST":
        createComment(request, post_id=id, post_comment=request.POST.get("comment"))
    return render(request, 'forum/viewpost.html', context)


##-----------------edit post------------------------##
def editPost(request, id):
    edited = False
    post = Posts.objects.get(id=id)
    context = {
        'post': post}
    if request.method == "POST":
        if request.user == post.author:
            if not request.POST.get("title") == post.post_title:
                post.post_title = request.POST.get("title")
                edited = True
                print('1')

            if not request.POST.get("content") == post.post_content:
                post.post_content = request.POST.get("content")
                edited = True
                print('2')
            if edited:
                post.save()
            return redirect('Forum-Home')

    return render(request, 'forum/editpost.html', context)


def deletePost(request, id):
    post = Posts.objects.get(pk=id)
    post.delete()
    return redirect('Forum-Home')


def createComment(request, post_id, post_comment):
    post = Posts.objects.get(pk=post_id)
    user = User.objects.get(username=request.user)
    comment = Comment()

    comment.post = post
    comment.comment_author = user
    comment.comment = post_comment
    comment.save()

    return redirect('View-Post', id=post_id)
