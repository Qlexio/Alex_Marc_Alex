from django.urls import path
from . import views

urlpatterns = [
    path('', views.index_view, name ='index'),
    path('rivet/', views.test2, name = 'rivet'),
    
]