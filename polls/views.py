from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
import json


def index_view(request):
    return render(request, 'polls/index.html')


# Test 2 listes déroulante mutliClass
def test2(request):

    if request.method == "POST":

        return HttpResponse("YOUPI!!! ☺☺☺")
    else:
        context = {}

        with open("products.json") as file:
            json_datas = json.load(file)

        context["js_json"] = json_datas


        return render(request, 'polls/articles.html', context)



