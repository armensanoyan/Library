from django.urls import path
from django.conf.urls.static import static

from library import settings
from . import views


app_name='app_library'

urlpatterns = [
    path('', views.book, name='book'),
    path('t', views.book),
    path('profile', views.profile, name='profile'),
    path('user_book', views.user_book),
    path('ajax/books', views.send_books),
    path('loginPage', views.loginPage),
    path('logoutPage', views.logoutPage),
    path('signIn', views.signin),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)