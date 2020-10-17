from django.urls import path
from . import views

urlpatterns =[
    path('forum/',views.forum, name = 'Forum-Home'),
    path('', views.home, name = 'Home')
]
