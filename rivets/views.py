from decimal import Decimal
from itertools import product
from unicodedata import category, decimal
from django.http import HttpRequest, HttpResponse
from django.shortcuts import get_object_or_404, render
import json
# from Alex_Marc_Alex.rivets.models import Category , Products
from rivets.models import (Rivet,Teinte,Type_teinte, Ral, Matiere, Type_reference
    , Longueur_corps, Diametre_corps, Products,Category)

def rivet(request):

    if request.method == "POST":

        # Données choisies par le client
        post_matiere_corps = request.POST.get("matiere_Corps")
        post_matiere_tige = request.POST.get("matiere_Tige")
        post_type_reference = request.POST.get("type")
        post_diametre = request.POST.get("diametre")
        post_longueur = request.POST.get("longueur")
        post_ral = request.POST.get("ral")
        post_teinte = request.POST.get("teinte")
        post_type_teinte = request.POST.get("type_teinte")
        
        # Dictionnaire context
        context = {}

        with open("static/json/products.json") as file:
            json_datas_products = json.load(file)
        
        with open("static/json/colors.json") as file:
            json_datas_colors = json.load(file)

        context["js_json_products"] = json_datas_products
        context["js_json_colors"] = json_datas_colors
        
        if post_matiere_corps != "" and post_matiere_tige != "" and post_type_reference != "" and post_diametre != "" and post_longueur != "":
            
            pk_matiere_corps = Matiere.objects.filter(libelle = post_matiere_corps).values("idMatiere")[0]["idMatiere"]
            
            pk_matiere_tige = Matiere.objects.filter(libelle = post_matiere_tige).values("idMatiere")[0]["idMatiere"]

            pk_type = Type_reference.objects.filter(libelle = post_type_reference).values("idType")[0]["idType"]                    

            pk_diametre = Diametre_corps.objects.filter(diametreCorps = Decimal(post_diametre)
                ).values("idDiametreCorps")[0]["idDiametreCorps"]  

            pk_longueur = Longueur_corps.objects.filter(longueurCorps = post_longueur
                    ).values("idLongueurCorps")[0]["idLongueurCorps"]
            
            quantite = Rivet.objects.filter(idMatiereCorps=pk_matiere_corps, idMatiereTige = pk_matiere_tige, idType = pk_type,
                idDiametreCorps = pk_diametre, idLongueurCorps = pk_longueur).values("quantite")[0]["quantite"]
                                    
        else:
            erreur_produit = "Veuillez choisir toutes les informations liées à la sélection du rivet."
            context["erreur_produit"] = erreur_produit
            return render(request, 'rivets/rivet.html', context)
            
        if post_teinte == "" or post_teinte == "Aucune":

            rivet = Rivet.objects.filter(idMatiereCorps=pk_matiere_corps, idMatiereTige = pk_matiere_tige, idType = pk_type,
                idDiametreCorps = pk_diametre, idLongueurCorps = pk_longueur).values("prix_brut")[0]["prix_brut"]
            
            context["sans_couleur"] = True

        else:
            if post_ral != "" and post_type_teinte !="":

                rivet = Rivet.objects.filter(idMatiereCorps =pk_matiere_corps, idMatiereTige = pk_matiere_tige, idType = pk_type,
                    idDiametreCorps = pk_diametre, idLongueurCorps = pk_longueur).values("prix_peint")[0]["prix_peint"]
                    
                pk_teinte = Teinte.objects.filter(libelle = post_teinte).values("idTeinte")[0]["idTeinte"]
                pk_type_teinte = Type_teinte.objects.filter(libelle = post_type_teinte).values("idType")[0]["idType"]
                code_hex = Ral.objects.filter(idTeinte = pk_teinte, libelle = post_ral, idType = pk_type_teinte).values("code_hex")[0]["code_hex"]
                
                context["ral"] = post_ral
                context["code_hex"] = code_hex
                context["sans_couleur"] = False

            else:
                
                erreur_couleur = "Veuillez choisir toutes les informations liées à la sélection de la couleur."
                context["erreur_couleur"] = erreur_couleur
                context["sans_couleur"] = True
                return render(request, 'rivets/rivet.html', context)
        
        context["matiere_corps"] = post_matiere_corps
        context["matiere_tige"] = post_matiere_tige
        context["type"] = post_type_reference
        context["diametre"] = post_diametre
        context["longueur"] = post_longueur
        context["prix"]= rivet
        context["quantite"]= quantite
        
        return render(request, 'rivets/rivet.html', context)

    else:
        context = {}

        with open("static/json/products.json") as file:
            json_datas_products = json.load(file)
        
        with open("static/json/colors.json") as file:
            json_datas_colors = json.load(file)

        context["js_json_products"] = json_datas_products
        context["js_json_colors"] = json_datas_colors


        return render(request, 'rivets/rivet.html', context)


def boutique_view(request):
    categories = Category.objects.all()
    return render(request,'rivets/boutique.html', context = {"categories":categories})

def script_js(request):
    return render(request,'rivets/script_js.html')


def produit_detail(request, slug):
    categories = get_object_or_404(Category, slug = slug)
    return render(request, 'rivets/detail.html', context = {"categories":categories}) 


