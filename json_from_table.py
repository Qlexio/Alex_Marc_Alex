import os
from django.core.wsgi import get_wsgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'GFIX.settings')
application = get_wsgi_application()

import json
from polls.models import (Rivet,Teinte,Type_teinte, Ral, Matiere, Type_reference,
    Diametre_corps, Longueur_corps)

rivet = Rivet.objects.all().values("idMatiereCorps",
     "idMatiereTige", "idType", "idDiametreCorps", "idLongueurCorps",
    ).order_by( "idMatiereCorps", "idMatiereTige", "idType", "idDiametreCorps", "idLongueurCorps")


json_dict_rivet = {}
for produit in rivet:
    matiere_corps = Matiere.objects.filter(pk= produit["idMatiereCorps"]).values("libelle")[0
        ]["libelle"]
    matiere_tige = Matiere.objects.filter(pk= produit["idMatiereTige"]).values("libelle")[0
        ]["libelle"]
    type_ref = Type_reference.objects.filter(pk= produit["idType"]).values("libelle"
        )[0]["libelle"]
    diametre = float(Diametre_corps.objects.filter(pk= produit["idDiametreCorps"]).values(
        "diametreCorps")[0]["diametreCorps"])
    longueur = Longueur_corps.objects.filter(pk= produit["idLongueurCorps"]).values(
        "longueurCorps")[0]["longueurCorps"]
    
    # Liste matière corps
    if json_dict_rivet.get(matiere_corps) is None:
        json_dict_rivet[matiere_corps] = {}
    
    # Liste matière tige dependant de matière corps
    if json_dict_rivet[matiere_corps].get(matiere_tige) is None:
        json_dict_rivet[matiere_corps][matiere_tige] = {}
   
    # Liste type dépendant des listes précédantes
    if json_dict_rivet[matiere_corps][matiere_tige].get(type_ref) is None:
        json_dict_rivet[matiere_corps][matiere_tige][type_ref] = {}
   
    # Liste diamètre dépendant des listes précédantes
    if json_dict_rivet[matiere_corps][matiere_tige][type_ref].get(diametre) is None:
        json_dict_rivet[matiere_corps][matiere_tige][type_ref][diametre] = []
    
    # Liste longueur dépendant des listes précédantes
    json_dict_rivet[matiere_corps][matiere_tige][type_ref][diametre].append(longueur)

with open("products.json", "w", encoding= "utf-8") as file:
    file.write(json.dumps(json_dict_rivet, indent= 4))

with open("products.json", "r") as file:
    datas_rivet = json.load(file)
    print(datas_rivet)

# Création du json pour la couleur du produit
ral_couleur = Ral.objects.all().values("idRal", "idTeinte", "idType", "numeroRal", "libelle",
    
    "code_hex").order_by("idTeinte","idType", "numeroRal")

json_dict_couleur = {
    "Aucune": {
        "Aucune": [
            "Aucune"
            
        ]

},}
for couleur in ral_couleur:
    teinte = Teinte.objects.filter(pk= couleur["idTeinte"]).values(
        "libelle")[0]["libelle"]
    ral = Ral.objects.filter(pk= couleur["idRal"]).values("numeroRal")[0
        ]["numeroRal"], Ral.objects.filter(pk= couleur["idRal"]).values("libelle")[0
        ]["libelle"]
    type_teinte = Type_teinte.objects.filter(pk= couleur["idType"]).values("libelle")[0
        ]["libelle"]
    
    print(ral)
    # Liste Teinte
    if json_dict_couleur.get(teinte) is None:
        json_dict_couleur[teinte] = {}

    # Liste Teinte
    if json_dict_couleur[teinte].get(str(ral[0]) + " / " + ral[1]) is None:
        json_dict_couleur[teinte][str(ral[0]) + " / " + ral[1]] = []
   
    json_dict_couleur[teinte][str(ral[0]) + " / " + ral[1]].append(type_teinte)


    # type de teinte brillant ou mat
    # json_dict_couleur[teinte] = []

    # print(json_dict_couleur)

with open("colors.json", "w", encoding= "utf-8") as file:
    file.write(json.dumps(json_dict_couleur, indent= 4))

with open("colors.json", "r") as file:
    datas_colors = json.load(file)

    
