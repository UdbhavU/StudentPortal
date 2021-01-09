from django.conf import settings
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.conf.urls.static import static
from django.contrib import admin

from django.urls import path, include, re_path

urlpatterns = [
                  path('admin/', admin.site.urls),
                  path('', include('forum.urls')),
                  path('', include('registration.urls')),
                  path('', include('userlogin.urls')),
                  path('', include('adminControl.urls')),
                  path('', include('resources.urls')),
                  path('', include('profiles.urls')),
                  path('', include('timetable.urls')),

              ] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += staticfiles_urlpatterns()