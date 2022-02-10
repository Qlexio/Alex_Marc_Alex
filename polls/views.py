from django.shortcuts import render
from django.core.serializers import serialize
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from .models import Matiere_corps, Matiere_tige ,Reference, Type_reference, Diametre_corps, Longueur_corps, Liste_produit
import json


def index_view(request):
    return render(request, 'polls/index.html')


# Test 2 listes déroulante mutliClass
def test2(request):
    context = {}

    with open("products.json") as file:
        json_datas = json.load(file)

    context["js_json"] = json_datas


    return render(request, 'polls/articles.html', context)

