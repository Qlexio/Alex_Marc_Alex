from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from .models import Articles
# from .forms import Test1 


def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")

def index_view(request):
    return render(request, 'polls/index.html')

# def articles_view(request):
#     return render(request, 'polls/articles.html')
    # article = articles.objects.all()
    # return render('polls/articles.html', {'article': article})

# def articles_view(request):
#     if request.method == 'POST':
#         # cree un formulaire et match avec les données de la requête:
#         # form = articlesForm(request.POST)

#         # récupation du contenu de ma class article
#         article = articles.objects.all()
#         return render_to_response('polls/articles.html',{'article': article})

#     else:
#         return HttpResponseRedirect("polls/index.html")

def test(request):

    # if request.method == "GET":
    # form = Test1()
    # print(form)
    type_rivet = Articles.objects.values("type_rivet").distinct()
    diametre_corps = Articles.objects.values("diametre_corps").distinct()
    longueur_corps = Articles.objects.values("longueur_corps").distinct()

    context = {}
    context["type_rivet"] = type_rivet
    context["diametre_corps"] = diametre_corps
    context["longueur_corps"] = longueur_corps

    return render(request, 'polls/articles.html', context)

    


