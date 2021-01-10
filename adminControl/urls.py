from django.urls import path
from . import views

urlpatterns =[
    path('announcement', views.announcement, name = 'ANC' ),
    path('editAnnouncement/<int:id>/', views.editAnnouncement, name = 'E-ANC' ),
    path('createResource/', views.createResource, name = 'C-RESOURCE' ),
    path('userList/', views.userList, name = 'USER' ),
    path('makeAdmin/<int:id>',views.makeAdmin, name="Make-Admin"),
    path('removeAdmin/<int:id>',views.removeAdmin, name="Remove-Admin"),
    path('createTimeTable',views.cTimeTable,name='C-Time-Table'),
    path('addSubject',views.addSubject,name='C-Subject'),

]