from django.shortcuts import render
import json
from polls.models import (Rivet,Teinte,Type_teinte, Ral, Matiere, Type_reference,
    Diametre_corps, Longueur_corps)


def index_view(request):
    return render(request, 'polls/index.html')


# Test 2 listes déroulante mutliClass
def test2(request):

    if request.method == "POST":

        post_matiere_corps = request.POST.get("matiere_Corps")
        post_matiere_tige = request.POST.get("matiere_Tige")
        post_type = request.POST.get("type")
        post_diametre = request.POST.get("diametre")
        post_longueur = request.POST.get("longueur")
        post_ral = request.POST.get("ral")
        
        context = {}

        with open("products.json") as file:
            json_datas_products = json.load(file)
        
        with open("colors.json") as file:
            json_datas_colors = json.load(file)

        context["js_json_products"] = json_datas_products
        context["js_json_colors"] = json_datas_colors

        if post_matiere_corps != "":
            pk_matiere_corps = Matiere.objects.filter(libelle=post_matiere_corps).values("idMatiere")[0]["idMatiere"]

            

        else:
            print("Veuillez chosir la matière du corps")
            # return 
        
        print(pk_matiere_corps)
        
        # if post_ral == "" or liste_teinte == "" :
        # rivet = Rivet.objects.filter("idMatiereCorps","idMatiereTige", 
        # "idType", "idDiametreCorps", "idLongueurCorps").values("prix_brut")[0]["prix_brut"]
        rivet = Rivet.objects.filter(idMatiereCorps=pk_matiere_corps).values("prix_brut")[0]["prix_brut"]
        print(rivet)

        # rivet = Rivet.objects.filter(idDiametreCorps=liste_diametre, idLongueurCorps=liste_longueur).values("prix_brut")



        # else:
        # rivet = Rivet.objects.filter("idMatiereCorps","idMatiereTige", 
        # "idType", "idDiametreCorps", "idLongueurCorps").values("prix_peint")[0]["prix_peint"]

        # t=  Rivet.objects.values("prix")
        # print(t)
        # rivet = Rivet.objects.filter("idDiametreCorps"==liste_diametre, "idLongueurCorps"==liste_longueur).values("prix_peint")
        # print(rivet)
        
        

        
        context["matiere_corps"] = liste_matiere_corps
        context["matiere_tige"] = liste_matiere_tige
        context["type"] = liste_type
        context["diametre"] = liste_diametre
        context["longueur"] = liste_longueur
        context["teinte"] = liste_teinte
        context["ral"] = liste_ral
        
        

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



