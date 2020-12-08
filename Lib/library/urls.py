from django.urls import include, path
from rest_framework import routers
from django.contrib import admin

from app_library import views


router = routers.DefaultRouter()
router.register(r'usersprofile', views.UserProfileViewSet)
router.register(r'users', views.UserViewSet)
router.register(r'book', views.BookViewSet)
router.register(r'groups', views.GroupViewSet)

urlpatterns = [
    path('api/', include(router.urls)),
    path('admin/', admin.site.urls),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    path('', include('app_library.urls')),
]