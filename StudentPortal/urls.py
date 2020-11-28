from django.conf import settings

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

              ] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
