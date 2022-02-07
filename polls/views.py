from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from .models import Reference, Type_reference, Diametre_corps, Longueur_corps, Liste_produit
# from .forms import Test1 

def index_view(request):
    return render(request, 'polls/index.html')

# def articles_view(request):
#     if request.method == 'POST':
#         # cree un formulaire et match avec les données de la requête:
#         # form = articlesForm(request.POST)

#         # récupation du contenu de ma class article
#         article = articles.objects.all()
#         return render_to_response('polls/articles.html',{'article': article})

#     else:
#         return HttpResponseRedirect("polls/index.html")

# Premier test sur la class Articles avec liste déroulante
# def test(request):

#     # if request.method == "GET":
#     # form = Test1()
#     # print(form)
#     type_rivet = Articles.objects.values("type_rivet").distinct()
#     diametre_corps = Articles.objects.values("diametre_corps").distinct()
#     longueur_corps = Articles.objects.values("longueur_corps").distinct()

#     context = {}
#     context["type_rivet"] = type_rivet
#     context["diametre_corps"] = diametre_corps
#     context["longueur_corps"] = longueur_corps

#     return render(request, 'polls/articles.html', context)

# Test 2 listes déroulante mutliClass
def test2(request):
    reference = Reference.objects.all().distinct()
    type = Type_reference.objects.all().distinct()
    diametreC = Diametre_corps.objects.all().distinct()
    longueurC = Longueur_corps.objects.all().distinct()
    listeP = Liste_produit.objects.all()

    context = {}
    context["reference"] = reference
    context["type"] = type
    context["diametreC"] = diametreC
    context["longueurC"] = longueurC
    context["listeP"] = listeP

    return render(request, 'polls/articles.html', context)

def get_json_ref_data(request):
    js_ref = list(Reference.objects.values())
    return JsonResponse({'data':js_ref})

def get_json_model_data(request, *arg, **kwargs):
    selected_ref = kwargs.get('reference')
    obj_models = list(Model.objects.filter(libelle = selected_ref), values())
    return JsonResponse({'data':obj_models})


