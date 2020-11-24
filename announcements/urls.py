from django.urls import path
from . import views

urlpatterns =[
    path('announcement', views.announcement, name = 'ANC' ),
]