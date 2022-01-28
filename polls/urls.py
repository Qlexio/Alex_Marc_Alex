from django.urls import path

from . import views

urlpatterns = [
    path('index/', views.index_view, name ='index'),
    path('articles/', views.test, name = 'articles'),
]