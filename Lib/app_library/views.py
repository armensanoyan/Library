from django.shortcuts import render, HttpResponse, redirect
from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from rest_framework import permissions
from django.core import serializers
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.forms import UserCreationForm
from django.contrib import messages


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

@login_required(login_url='/accounts/login/')
def book(request):
    books = Book.objects.all().order_by(request.GET['field']) if request.GET else Book.objects.all()
    content = {
        'user': request.user.username.title(),
        'books': books,
    }
    if request.path == '/t':
        url = 'app_library/book_table.html'
    else:
        url = 'app_library/book_list.html'

    return render(request, url, content)
    
@login_required(login_url='/accounts/login/')
def profile(request):
    user_books_list = request.user.userprofile.user_books.split(',')
    user_books_list.remove('') if '' in user_books_list else user_books_list
    books = [Book.objects.get(id=id) for id in user_books_list]

    content = {
        'user': request.user.username.title(),
        'books': books,
        'userprofile': request.user.userprofile,
    }
    return render(request, 'app_library/profile.html', content)

@login_required(login_url='/accounts/login/')
def user_book(request):
    user_books = request.user.userprofile.user_books.split(',')
    user_books.remove('') if '' in user_books else user_books
    if id.isdigit() and not id in user_books:
        userProfile.user_books = id + ',' + userProfile.user_books 
        userProfile.save() 
    return HttpResponse("",content_type='application/json')
@login_required(login_url='/accounts/login/')
def send_books(request):
    qs = Book.objects.all()
    qs_json = serializers.serialize('json', qs)
    return HttpResponse(qs_json, content_type='application/json')

def loginPage(request):
    if request.POST:
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('/')
        messages.error(request, 'wrong user name or password')
    return render(request, 'registration/login.html')

def logoutPage(request):
    logout(request)
    return redirect('/accounts/login')

def signin(request):
    if request.method == 'POST':
        username = request.POST['username']
        if username is None or username is'':
            messages.error(request, "user name shouldn't be empty")
            
        passowrd1 = request.POST['password1']
        if not passowrd1:
            messages.error(request, "please provide password")

        passowrd2 = request.POST['password2']
        if passowrd1 !=passowrd2:
            messages.error(request, "passwords should be the same")

        last_name = request.POST['secondname']
        first_name = request.POST['firstname']

        email = request.POST['email']
        photo = request.POST['photo'] 
        phone_number = request.POST['tel'] 
        
        if not list(messages.get_messages(request)):
            print('yes')
            user = User.objects.create_user(username=username, email=email, first_name=first_name, last_name=last_name)
            userprofile = UserProfile(user=user, image=photo, phone_number=phone_number)
            return redirect('/')
    return render(request, 'app_library/signin.html')