import PIL
import os
from django.contrib.auth.models import User, Group
from rest_framework import serializers

from .models import UserProfile, Book


class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ['url', 'username', 'email']


class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ['url', 'name']


class BookSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Book
        fields = ['title', 'author','country','imagelink','language','link','pages','year']


class UserProfileSerializer(serializers.HyperlinkedModelSerializer):
    user = UserSerializer()

    class Meta:
        model = UserProfile
        fields = ['url','image','phone_number','user','user_books']

    def create(self, validated_data):
        user = User.objects.create(**validated_data.pop('user'))
        userprofile = UserProfile.objects.create(user=user, **validated_data)
        return userprofile

    def update(self, instance, validated_data):
        profile_data = validated_data.pop('user')

        user = instance.user
        instance.image = validated_data.get('image', instance.image)
        instance.phone_number = validated_data.get('phone_number', instance.phone_number)
        instance.user_books = validated_data.get('user_books', instance.user_books)
        instance.save()

        user.username = profile_data.get('username', user.username)
        user.eamil = profile_data.get('email', user.email)
        user.save()

        return instance


