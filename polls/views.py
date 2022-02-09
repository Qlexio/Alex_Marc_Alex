from django.shortcuts import render
from django.core.serializers import serialize
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from .models import Matiere_corps, Matiere_tige ,Reference, Type_reference, Diametre_corps, Longueur_corps, Liste_produit



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
    matiere_Corps = Matiere_corps.objects.all().distinct()
    matiereT = Matiere_tige.objects.all().distinct()
    reference = Reference.objects.all().distinct()
    type = Type_reference.objects.all().distinct()
    diametreC = Diametre_corps.objects.all().distinct()
    longueurC = Longueur_corps.objects.all().distinct()
    # listeP = Liste_produit.objects.all()


    listeP = Liste_produit.objects.all().values('idReference', 'idType',
         'idDiametreCorps', 'idLongueurCorps')
    
    # # Récupération des données contenus dans les classes en lien avec la liste
    # r = Reference.objects.all().values('idReference', 'libelle').order_by('libelle')
    # t = Type_reference.objects.all().values('idType', 'libelle')
    # d = Diametre_corps.objects.all().values('idDiametreCorps', 'diametreCorps')
    # l = Longueur_corps.objects.all().values('idLongueurCorps', 'longueurCorps')

    # # data = serialize("json", listeP, fields = ('idReference', 'idType',
    # #      'idDiametreCorps', 'idLongueurCorps'), ensure_ascii= False)
    # data = list(listeP)

    # data1 = list(r)
    
    # # incomprhésion sur le lien de l'id sur le code

    # for all in listeP:
    #     print(all)
    #     for ref in r:
    #         print(ref)
    #     for typer in t:
    #         print(typer)
    #     for diam in d:
    #         print(diam)
    #     for long in l:
    #         print(long)

    # # dt = list(t)
    # # dd = list(d)
    # # dl = list(l)
    # # for i in data:
    #     # soit R la référence
        


    
    # print(data)

    # for mc in listeP:
    #     context2 = {}
    #     for mt in matiereT:

    context = {}

    with open("products.json", "r") as file:
        context["json"] = file.read()

    print(context["json"])
    # context["matiere_Corps"] = matiere_Corps
    # context["matiereT"] = matiereT
    # context["reference"] = reference
    # context["type"] = type
    # context["diametreC"] = diametreC
    # context["longueurC"] = longueurC
    # # context["listeP"] = listeP
    # context["test"] = data
    # # context["dr"] = dr
    # # context["dt"] = dt
    # # context["dd"] = dd
    # # context["dl"] = dl
    

    return render(request, 'polls/articles.html', context)

# def get_json_ref_data(request):
#     js_ref = list(Reference.objects.values())
#     return JsonResponse({'data':js_ref})

# def get_json_model_data(request, *arg, **kwargs):
#     selected_ref = kwargs.get('reference')
#     obj_models = list(Model.objects.filter(libelle = selected_ref), values())
#     return JsonResponse({'data':obj_models})

