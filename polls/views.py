from decimal import Decimal
from unicodedata import decimal
from django.shortcuts import render
import json
from polls.models import (Rivet,Teinte,Type_teinte, Ral, Matiere, Type_reference
    , Longueur_corps, Diametre_corps)


def index_view(request):
    return render(request, 'polls/index.html')


# Test 2 listes déroulante mutliClass
def test2(request):

    if request.method == "POST":

        diamt = Diametre_corps.objects.all().values("diametreCorps")[0]["diametreCorps"]
        # print(type(diamt))
        # for ig in diamt:
        #     print(ig)
        # print(diamt)

        post_matiere_corps = request.POST.get("matiere_Corps")
        post_matiere_tige = request.POST.get("matiere_Tige")
        post_type = request.POST.get("type")
        post_diametre = request.POST.get("diametre")
        post_longueur = request.POST.get("longueur")
        post_ral = request.POST.get("ral")
        post_teinte = request.POST.get("teinte")
        
        context = {}
        # vvv = Diametre_corps.objects.filter(diametreCorps = post_diametre).values("idDiametreCorps")[0]["idDiametreCorps"]        
        # print(vvv)

        with open("products.json") as file:
            json_datas_products = json.load(file)
        
        with open("colors.json") as file:
            json_datas_colors = json.load(file)

        context["js_json_products"] = json_datas_products
        context["js_json_colors"] = json_datas_colors
        
        if post_matiere_corps != "" and post_matiere_tige != "" and post_type != "" and post_diametre != "" and post_longueur != "":
            pk_matiere_corps = Matiere.objects.filter(libelle = post_matiere_corps).values("idMatiere")[0]["idMatiere"]
            
            pk_matiere_tige = Matiere.objects.filter(libelle = post_matiere_tige).values("idMatiere")[0]["idMatiere"]

            pk_type = Type_reference.objects.filter(libelle = post_type).values("idType")[0]["idType"]                    

            pk_diametre = Diametre_corps.objects.filter(diametreCorps = Decimal(post_diametre)
                ).values("idDiametreCorps")[0]["idDiametreCorps"]  

            pk_longueur = Longueur_corps.objects.filter(longueurCorps = post_longueur
                    ).values("idLongueurCorps")[0]["idLongueurCorps"]
                        
        else:
            print("Veuillez chosir la matière du corps")
            
        print(post_teinte)
        if post_ral == "" or post_teinte == "":

            rivet = Rivet.objects.filter(idMatiereCorps=pk_matiere_corps, idMatiereTige = pk_matiere_tige, idType = pk_type,
                idDiametreCorps = pk_diametre, idLongueurCorps = pk_longueur).values("prix_brut")[0]["prix_brut"]
            print(rivet)

        else:
            rivet = Rivet.objects.filter(idMatiereCorps=pk_matiere_corps, idMatiereTige = pk_matiere_tige, idType = pk_type,
                idDiametreCorps = pk_diametre, idLongueurCorps = pk_longueur).values("prix_peint")[0]["prix_peint"]
            context["ral"] = post_ral
        
        context["matiere_corps"] = post_matiere_corps
        context["matiere_tige"] = post_matiere_tige
        context["type"] = post_type
        context["diametre"] = post_diametre
        context["longueur"] = post_longueur
        context["prix"]= rivet

        # return HttpResponse("YOUPI!!! ☺☺☺")
        return render(request, 'polls/rivet.html', context)
    else:
        context = {}

        with open("products.json") as file:
            json_datas_products = json.load(file)
        
        with open("colors.json") as file:
            json_datas_colors = json.load(file)

        context["js_json_products"] = json_datas_products
        context["js_json_colors"] = json_datas_colors


        return render(request, 'polls/rivet.html', context)



