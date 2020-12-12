from django.urls import path
from django.conf.urls.static import static

from library import settings
from . import views


app_name='app_library'

urlpatterns = [
    path('', views.book),
    path('book/list', views.book),
    path('book/table', views.book),
    path('profile', views.profile),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)