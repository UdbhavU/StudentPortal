from django.urls import path
from . import views

urlpatterns =[
    path('announcement', views.announcement, name = 'ANC' ),
    path('editAnnouncement/<int:id>/', views.editAnnouncement, name = 'E-ANC' ),
    path('createResource/', views.createResource, name = 'C-RESOURCE' ),
    path('userList/', views.userList, name = 'USER' ),
]