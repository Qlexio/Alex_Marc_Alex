import os
from django.core.wsgi import get_wsgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'GFIX.settings')
application = get_wsgi_application()

import json
from collections import defaultdict
from polls.models import (Liste_produit, Matiere_corps, Matiere_tige, Reference, Type_reference,
    Diametre_corps, Longueur_corps)


# Mise à jour du json avec la nouvelle base de données
# Modification faite sur la table liste_produit

liste_produits = Liste_produit.objects.all().values("idMatiereCorps",
     "idMatiereTige","idReference", "idType", "idDiametreCorps", "idLongueurCorps",
     "quantite", "prix"
    ).order_by("idMatiereCorps", "idMatiereTige", "idReference", "idType", "idDiametreCorps", "idLongueurCorps")


json_dict = {}
for produit in liste_produits:
    matiere_corps = Matiere_corps.objects.filter(pk= produit["idMatiereCorps"]).values("matiereCorps")[0
        ]["matiereCorps"]
    matiere_tige = Matiere_tige.objects.filter(pk= produit["idMatiereTige"]).values("matiereTige")[0
        ]["matiereTige"]
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
    
    # Liste matière corps
    if json_dict.get(matiere_corps) is None:
        json_dict[matiere_corps] = {}
    
    # Liste matière tige dependant de matière corps
    if json_dict[matiere_corps].get(matiere_tige) is None:
        json_dict[matiere_corps][matiere_tige] = {}

    # Liste référence dépendant des listes précédantes
    if json_dict[matiere_corps][matiere_tige].get(ref) is None:
        json_dict[matiere_corps][matiere_tige][ref] = {}
    
    # Liste type dépendant des listes précédantes
    if json_dict[matiere_corps][matiere_tige][ref].get(type_ref) is None:
        json_dict[matiere_corps][matiere_tige][ref][type_ref] = {}
   
    # Liste diamètre dépendant des listes précédantes
    if json_dict[matiere_corps][matiere_tige][ref][type_ref].get(diametre) is None:
        json_dict[matiere_corps][matiere_tige][ref][type_ref][diametre] = []
    
    # Liste longueur dépendant des listes précédantes
    json_dict[matiere_corps][matiere_tige][ref][type_ref][diametre].append(longueur)

# import pprint
# pprint.pprint(json_dict)

with open("products.json", "w", encoding= "utf-8") as file:
    file.write(json.dumps(json_dict, indent= 4)) #, ensure_ascii= False))

with open("products.json", "r") as file:
    datas = json.load(file)
    print(datas)