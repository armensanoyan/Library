from django.contrib import admin

from .models import Book, UserProfile


class BookAdmin(admin.ModelAdmin):
    list_display = ['title', 'author', 'language', 'pages', 'year']
    list_filter = ['language']
    search_fields = ['title', 'author']

admin.site.register(Book, BookAdmin)


class UserProfileAdmin(admin.ModelAdmin):
    list_display = ['user', 'phone_number']
    list_filter = ['user']

admin.site.register(UserProfile, UserProfileAdmin)
