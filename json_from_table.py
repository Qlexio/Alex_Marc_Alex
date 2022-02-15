import os
from django.core.wsgi import get_wsgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'GFIX.settings')
application = get_wsgi_application()

import json
from collections import defaultdict
from polls.models import (Rivet,Teinte, Ral, Matiere, Type_reference,
    Diametre_corps, Longueur_corps)

rivet = Rivet.objects.all().values("idMatiereCorps",
     "idMatiereTige", "idType", "idDiametreCorps", "idLongueurCorps",
        "quantite", "prix"
    ).order_by("idMatiereCorps", "idMatiereTige", "idType", "idDiametreCorps", "idLongueurCorps")


json_dict_rivet = {}
for produit in rivet:
    matiere_corps = Matiere.objects.filter(pk= produit["idMatiereCorps"]).values("libelle")[0
        ]["libelle"]
    matiere_tige = Matiere.objects.filter(pk= produit["idMatiereTige"]).values("libelle")[0
        ]["libelle"]
    type_ref = Type_reference.objects.filter(pk= produit["idType"]).values("libelle"
        )[0]["libelle"]
    diametre = Diametre_corps.objects.filter(pk= produit["idDiametreCorps"]).values(
        "diametreCorps")[0]["diametreCorps"]
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
ral_couleur = Ral.objects.all().values("idRal","idTeinte", "numeroRal"
    ).order_by("idTeinte", "numeroRal")

json_dict_couleur = {}
for couleur in ral_couleur:
    teinte = Teinte.objects.filter(pk= couleur["idTeinte"]).values(
        "libelle")[0]["libelle"]
    ral = Ral.objects.filter(pk= couleur["idRal"]).values("numeroRal")[0
        ]["numeroRal"]
    print(teinte)
    
    # Liste Teinte
    if json_dict_couleur.get(teinte) is None:
        json_dict_couleur[teinte] = []


    # Liste Ral de chaque teinte
    if ral >= 1000 and ral <2000:
        ral_jaune = ral
        json_dict_couleur[teinte].append(ral_jaune)

    if ral >= 2000 and ral <3000:
        ral_orange = ral
        json_dict_couleur[teinte].append(ral_orange)

    if ral >= 3000 and ral <4000:
        ral_rouge = ral
        json_dict_couleur[teinte].append(ral_rouge)
    
    if ral >= 4000 and ral <5000:
        ral_violet = ral
        json_dict_couleur[teinte].append(ral_violet)
    
    if ral >= 5000 and ral <6000:
        ral_bleu = ral
        json_dict_couleur[teinte].append(ral_bleu)
    
    if ral >= 6000 and ral <7000:
        ral_vert = ral
        json_dict_couleur[teinte].append(ral_vert)
    
    if ral >= 7000 and ral <8000:
        ral_gris = ral
        json_dict_couleur[teinte].append(ral_gris)

    if ral >= 8000 and ral <9000:
        ral_brun = ral
        json_dict_couleur[teinte].append(ral_brun)

    if ral >= 9000 and ral <10000:
        ral_blanc_noir = ral
        json_dict_couleur[teinte].append(ral_blanc_noir)

with open("colors.json", "w", encoding= "utf-8") as file:
    file.write(json.dumps(json_dict_couleur, indent= 4))

with open("colors.json", "r") as file:
    datas_colors = json.load(file)
    print(datas_colors) 

    
