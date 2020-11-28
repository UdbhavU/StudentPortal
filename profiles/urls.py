from django.urls import path
from . import views
urlpatterns = [
    path('profile/<int:id>/',views.viewProfile,name="Profile"),
    path('editProfile/',views.editProfile,name="E-Profile"),

]

