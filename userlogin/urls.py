from django.urls import path
from . import views

urlpatterns = [
path('login/',views.userlogin ,name = "userlogin"),
path('logout/',views.userlogout ,name = "userlogout"),
]
