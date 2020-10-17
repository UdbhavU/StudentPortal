from django.urls import path
from . import views

urlpatterns =[
    path('',views.home, name = 'Home'),
    path('forum/',views.forum, name = 'Forum-Home')
]