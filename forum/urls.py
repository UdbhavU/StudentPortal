from forum.views import createPost
from django.urls import path
from . import views

urlpatterns =[
    path('',views.home, name = 'Home'),
    path('forum/',views.forum, name = 'Forum-Home'),
    path('create_post/', views.createPost, name = 'Create-Post'),
    path('edit_post/<int:id>/', views.editPost, name = 'Edit-Post'),
    path('view_post/<int:id>/', views.viewPost, name = 'View-Post'),
    path('comment_post/<int:post_id>/', views.createComment, name = 'Comment-Post'),
    path('delete_post/<int:id>/', views.deletePost, name = 'Delete-Post')
]