from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
import json
from polls.models import (Type_teinte, Ral, Rivet)


def index_view(request):
    return render(request, 'polls/index.html')


# Test 2 listes déroulante mutliClass
def test2(request):

    if request.method == "POST":

        # Test de recupération de l'id pour affichage du prix
        testId = Rivet.objects.all()

    
        matiere_corps = request.POST.get("matiere_Corps")
        matiere_tige = request.POST.get("matiere_Tige")
        type = request.POST.get("type")
        diametre = request.POST.get("diametre")
        longueur = request.POST.get("longueur")
        teinte = request.POST.get("teinte")
        ral = request.POST.get("ral")

        context = {}

        with open("products.json") as file:
            json_datas_products = json.load(file)
        
        with open("colors.json") as file:
            json_datas_colors = json.load(file)

        context["js_json_products"] = json_datas_products
        context["js_json_colors"] = json_datas_colors
        context["matiere_corps"] = matiere_corps
        context["matiere_tige"] = matiere_tige
        context["type"] = type
        context["diametre"] = diametre
        context["longueur"] = longueur
        context["teinte"] = teinte
        context["ral"] = ral
        context["testId"] = testId

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



