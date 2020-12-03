from django.urls import path
from . import views
urlpatterns = [

    path('timetable/<int:id>/', views.timetable, name="Time-Table"),
    path('createTimetable/<str:id>/', views.createTimeTable, name="C-Time-Table"),
    path('editTimetable/<str:id>/', views.editTimeTable, name="E-Time-Table")
]