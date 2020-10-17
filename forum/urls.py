from django.urls import path
from . import views

urlpatterns =[
    path('',views.forum, name = 'Forum-Home')
]