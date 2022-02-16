from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
import json


def index_view(request):
    return render(request, 'polls/index.html')


# Test 2 listes déroulante mutliClass
def test2(request):

    if request.method == "POST":

        # return HttpResponse("YOUPI!!! ☺☺☺")
        return render(request, 'polls/rivet.html',)
    else:
        context = {}

        with open("products.json") as file:
            json_datas_products = json.load(file)
        
        with open("colors.json") as file:
            json_datas_colors = json.load(file)

        context["js_json_products"] = json_datas_products
        context["js_json_colors"] = json_datas_colors


        return render(request, 'polls/rivet.html', context)



