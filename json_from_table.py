import os
from django.core.wsgi import get_wsgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'GFIX.settings')
application = get_wsgi_application()

import json
from collections import defaultdict
from polls.models import (Liste_produit, Reference, Type_reference,
    Diametre_corps, Longueur_corps)


liste_produits = Liste_produit.objects.all().values(
    "idReference", "idType", "idDiametreCorps", "idLongueurCorps"
    ).order_by("idReference", "idType", "idDiametreCorps", "idLongueurCorps")


json_dict = {}
for produit in liste_produits:
    ref = Reference.objects.filter(pk= produit["idReference"]).values("libelle")[0
        ]["libelle"]
    # print(ref, " - ", type(ref))
    type_ref = Type_reference.objects.filter(pk= produit["idType"]).values("libelle"
        )[0]["libelle"]
    # print(type_ref, " - ", type(type_ref))
    diametre = Diametre_corps.objects.filter(pk= produit["idDiametreCorps"]).values(
        "diametreCorps")[0]["diametreCorps"]
    # print(diametre, " - ", type(diametre))
    longueur = Longueur_corps.objects.filter(pk= produit["idLongueurCorps"]).values(
        "longueurCorps")[0]["longueurCorps"]
    # print(longueur, " - ", type(longueur))
    
    if json_dict.get(ref) is None:
        json_dict[ref] = {}
    if json_dict[ref].get(type_ref) is None:
        json_dict[ref][type_ref] = {}
    if json_dict[ref][type_ref].get(diametre) is None:
        json_dict[ref][type_ref][diametre] = []
    json_dict[ref][type_ref][diametre].append(longueur)

# import pprint
# pprint.pprint(json_dict)

with open("products.json", "w", encoding= "utf-8") as file:
    file.write(json.dumps(json_dict, indent= 4)) #, ensure_ascii= False))

with open("products.json", "r") as file:
    datas = json.load(file)
    print(datas)