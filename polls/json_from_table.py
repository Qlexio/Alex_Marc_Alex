import json
import os

# django project name is adleads, replace adleads with your project name
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "GFIX.settings")

# from models import Liste_produit, Reference, Type_reference, Diametre_corps, Longueur_corps
from .models import (Liste_produit, Reference, Type_reference,
    Diametre_corps, Longueur_corps)


liste_produits = Liste_produit.objects.all().values("idReference").order_by("idReference")

print(liste_produits)