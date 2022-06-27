# sendemail/urls.py
from django.contrib import admin
from django.urls import path

from .views import contactView, contact_usView , success_usView , successView

urlpatterns = [
    path('contact/', contactView, name='contact'),
    path('success/', successView, name='success'),
    path('contact_us/', contact_usView, name='contact_us'),
    path('success_us/', success_usView, name='success_us'),
]