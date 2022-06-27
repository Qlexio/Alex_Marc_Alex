"""GFIX URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import include, path
# from rivets import views as rivet_views
from rivecol import views as rivecol_views
# from connexion_non_terminé import views as connexion_views
from django.conf.urls.static import static
from django.conf import settings
from accounts.views import signup, logout_user
from rivets.views import boutique_view, rivet, script_js, produit_detail



urlpatterns = [
    path('admin/', admin.site.urls),
    path('', rivecol_views.accueil_view, name="accueil"),
    path('couleurs-disponibles/', rivecol_views.couleur_view, name="couleur"),

    path('contact/', include('sendemail.urls')),
    path('mention_legale/', rivecol_views.mention_legal_view, name="mention-legale"),
    path('condetions-de-vente/', rivecol_views.condition_vente_view, name="condition"),

    path('signup/', signup, name="signup"), 
    path('logout/', logout_user, name="logout"),
    path('boutique/', boutique_view, name="boutique"),
    path('detail/<str:slug>/', produit_detail, name="produit"),
    # path('panier/', rivecol_views.panier_view, name="panier"), 


    path('rivet/', rivet, name="rivet"),
    path('script/', script_js, name="script"),
    
]   +static(settings.STATIC_URL, document_root = settings.STATIC_ROOT)