from django.urls import path



from . import views

urlpatterns = [
    path('', views.index_view, name ='index'),
    path('articles/', views.test2, name = 'articles'),
    # path('<int:pk>', views.Diametre_corps.as_view(), name = 'article_change'),
    

]