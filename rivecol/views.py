from django.shortcuts import render

def accueil_view(request):
    return render(request, 'rivecol/accueil.html')

def contact_view(request):
    return render(request, 'rivecol/contact.html')

# def boutique_view(request):
#     return render(request, 'rivecol/boutique.html')

def couleur_view(request):
    return render(request, 'rivecol/nuancier.html')

def mentions_legales_view(request):
    return render(request, 'rivecol/mention_legale.html')

# def panier_view(request):
#     return render(request, 'rivecol/panier.html')