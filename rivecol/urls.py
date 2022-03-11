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
from rivets import views as rivet_views
from rivecol import views as rivecol_views
# from connexion_non_terminé import views as connexion_views
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', rivecol_views.accueil_view, name="accueil"),
    path('contact/', rivecol_views.contact_view, name="contact"),
    # path('boutique/', rivecol_views.boutique_view, name="boutique"),
    path('couleurs-disponibles/', rivecol_views.couleur_view, name="couleur"),
    # path('mentions-legales/', rivecol_views.mentions_legales_view, name="mentions-légales"),
    # path('connexion-enregistrement/', connexion_views.connexion_view, name="connexion"),
    # path('panier/', rivecol_views.panier_view, name="panier"),
    path('condetions-de-vente/', rivecol_views.condition_vente_view, name="panier"),
    path('rivet/', rivet_views.rivet, name="rivet"),
    
]   +static(settings.STATIC_URL, document_root = settings.STATIC_ROOT)