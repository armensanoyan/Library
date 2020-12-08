from django.shortcuts import render
from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from rest_framework import permissions
from app_library.serializers import UserSerializer, GroupSerializer, BookSerializer, UserProfileSerializer
from .models import Book, UserProfile

class UserProfileViewSet(viewsets.ModelViewSet):
    queryset = UserProfile.objects.all()
    serializer_class = UserProfileSerializer
    permission_classes = [permissions.IsAdminUser]


class UserViewSet(viewsets.ModelViewSet):
    
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer
    permission_classes = [permissions.IsAuthenticated]


class GroupViewSet(viewsets.ModelViewSet):
    
    queryset = Group.objects.all()
    serializer_class = GroupSerializer
    permission_classes = [permissions.IsAuthenticated]



class BookViewSet(viewsets.ModelViewSet):
    
    queryset = Book.objects.all()
    serializer_class = BookSerializer
    permission_classes = [permissions.IsAuthenticated]

def look(request):
    return profile(request)

def book(request):
    content = {
        'user_name': str(request.user).title()
    }
    return render(request, 'app_library/book.html', content)

def profile(request):
    print('a')
    content = {
        'user': request.user
    }
    return render(request, 'app_library/profile.html', content)