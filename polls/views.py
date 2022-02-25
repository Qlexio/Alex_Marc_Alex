from django.shortcuts import render
import json
from polls.models import (Rivet,Teinte,Type_teinte, Ral, Matiere, Type_reference
    , Longueur_corps, Diametre_corps)


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
        # vvv = Diametre_corps.objects.filter(diametreCorps = post_diametre).values("idDiametreCorps")[0]["idDiametreCorps"]        
        # print(vvv)

        with open("products.json") as file:
            json_datas_products = json.load(file)
        
        with open("colors.json") as file:
            json_datas_colors = json.load(file)

        context["js_json_products"] = json_datas_products
        context["js_json_colors"] = json_datas_colors
        
        if post_matiere_corps != "":
            pk_matiere_corps = Matiere.objects.filter(libelle = post_matiere_corps).values("idMatiere")[0]["idMatiere"]
            
            if post_matiere_tige != "":
                pk_matiere_tige = Matiere.objects.filter(libelle = post_matiere_tige).values("idMatiere")[0]["idMatiere"]
                print(pk_matiere_tige)

                if post_type != "":
                    pk_type = Type_reference.objects.filter(libelle = post_type).values("idType")[0]["idType"]                    
                    print(pk_type)

                    if post_diametre != "":
                        # problème lié au . dans la base de données
                        jjj = Diametre_corps.objects.filter(idDiametreCorps = 1
                            ).values("diametreCorps")[0]["diametreCorps"] 
                        print(jjj)
                        print(jjj==float(post_diametre))
                        print(type(post_diametre))
                        pk_diametre = Diametre_corps.objects.filter(diametreCorps = post_diametre
                            ).values("idDiametreCorps")[0]["idDiametreCorps"]                           

                        if post_longueur != "":
                            pk_longueur = Longueur_corps.objects.filter(longueurCorps = post_longueur
                                ).values("idLongueurCorps")[0]["idLongueurCorps"]
                        
                        else:
                            print("veuillez choisir une longueur")

                    else:
                        print("Veuillez chosir un diamètre")

                else:
                    print("Veuillez chosir la matière de la tige")

            else:
                print("Veuillez chosir la matière du corps")

        else:
            print("Veuillez chosir la matière du corps")
            # return 
        
        if post_ral == "" :
            ri = Rivet.objects.all().values("prix_brut")[0]["prix_brut"]
            print(ri)

            rivet = Rivet.objects.filter(idMatiereCorps=pk_matiere_corps, idMatiereTige = pk_matiere_tige, idType = pk_type,
                idDiametreCorps = pk_diametre, idLongueurCorps = pk_longueur).values("prix_brut")[0]["prix_brut"]
            print(rivet)

        else:
            rivet = Rivet.objects.filter(idMatiereCorps=pk_matiere_corps, idMatiereTige = pk_matiere_tige, idType = pk_type,
                idDiametreCorps = pk_diametre, idLongueurCorps = pk_longueur).values("prix_peint")[0]["prix_peint"]
            context["ral"] = post_ral
        
        context["matiere_corps"] = post_matiere_corps
        context["matiere_tige"] = post_matiere_tige
        context["type"] = post_type
        context["diametre"] = post_diametre
        context["longueur"] = post_longueur
        context["prix"]= rivet

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



