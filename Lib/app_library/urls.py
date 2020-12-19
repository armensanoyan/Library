from django.urls import path
from django.conf.urls.static import static

from library import settings
from . import views


app_name='app_library'

urlpatterns = [
    path('', views.book),
    path('t', views.book),
    path('profile', views.profile),
    path('ajax/books', views.ajax),
    path('user_book', views.user_book),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)