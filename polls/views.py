from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from .models import articles
from .forms import articlesForm2 


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
    form = articlesForm2()


    return render('polls/articles.html', {'form': form})


