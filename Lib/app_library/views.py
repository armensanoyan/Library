from django.shortcuts import render, HttpResponse
from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from rest_framework import permissions
from django.core import serializers

from app_library.serializers import UserSerializer, GroupSerializer, BookSerializer, UserProfileSerializer
from .models import Book, UserProfile


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


def book(request):
    books = Book.objects.all().order_by(request.GET['field']) if request.GET else Book.objects.all()
    content = {
        'user_name': str(request.user).title(),
        'books': books,
    }
    if request.path == '/t':
        url = 'app_library/book_table.html'
    else:
        url = 'app_library/book_list.html'

    return render(request, url, content)

def profile(request):
    user_books_list = request.user.userprofile.user_books.split(',')
    user_books_list.remove('') if '' in user_books_list else user_books_list
    books = [Book.objects.get(id=id) for id in user_books_list]

    content = {
        'user': request.user,
        'books': books
    }
    return render(request, 'app_library/profile.html', content)


def user_book(request):
    user_books = request.user.userprofile.user_books.split(',')
    user_books.remove('') if '' in user_books else user_books
    if id.isdigit() and not id in user_books:
        userProfile.user_books = id + ',' + userProfile.user_books 
        # userProfile.save() 
    print(request)
    return HttpResponse("",content_type='application/json')