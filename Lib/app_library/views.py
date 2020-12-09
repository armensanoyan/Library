from django.shortcuts import render
from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from rest_framework import permissions
from app_library.serializers import UserSerializer, GroupSerializer, BookSerializer, UserProfileSerializer

from .models import Book, UserProfile
from .filter import BookFilter


class UserProfileViewSet(viewsets.ModelViewSet):
    queryset = UserProfile.objects.all()
    serializer_class = UserProfileSerializer
    permission_classes = [permissions.IsAdminUser]

    def destroy(self, request, pk=None):
        if pk:
            removed_user = User.objects.get(id=pk)
            removed_user.delete()


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
    filter = BookFilter(request.GET, Book.objects.all())
    content = {
        'user_name': str(request.user).title(),
        'books': filter.qs,
        'filter': filter,
    }
    return render(request, 'app_library/book.html', content)

def profile(request):
    content = {
        'user': request.user,
        'profile': UserProfile.objects.get(id=request.user.id),
    }
    return render(request, 'app_library/profile.html', content)