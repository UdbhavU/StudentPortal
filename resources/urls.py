from django.urls import path
from . import views

urlpatterns = [
    path("resources/<int:id>/",views.viewResource, name='RESOURCE'),
]