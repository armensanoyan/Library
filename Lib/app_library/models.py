from django.db import models
from django.utils.translation import gettext as _
from django.contrib.auth.models import User
from django.core.validators import RegexValidator
from multiselectfield import MultiSelectField



class Book(models.Model):

    id = models.IntegerField(primary_key=True)
    author = models.CharField(_("book"), max_length=50, blank=True, null=True)
    country = models.CharField(_("book"), max_length=50, blank=True, null=True)
    imageLink = models.ImageField(_(""), upload_to='static/images')
    language = models.CharField(_("language"), max_length=50, blank=True, null=True)
    link = models.URLField(_("url"), max_length=200, blank=True, null=True)
    pages = models.IntegerField(_("page number"))
    title = models.CharField(_("Title"), max_length=100)
    year = models.IntegerField(_("year"), blank=True, null=True)

    def __str__(self):
        return self.title


class UserProfile(models.Model):

    user = models.ForeignKey(User, on_delete=models.CASCADE)
    image = models.ImageField(_("user image"), upload_to='media')
    phone_regex = RegexValidator(regex=r'^\+?1?\d{9,15}$', message="Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed.")
    phone_number = models.CharField(validators=[phone_regex], max_length=17, blank=True) 
    user_books = models.TextField(_("books names"), blank=True, null=True)

    def __str__(self):
        return self.user.username