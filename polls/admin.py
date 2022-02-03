from django.contrib import admin

from .models import Reference, Type_reference, Diametre_corps, Longueur_corps, Liste_produit


admin.site.register(Reference)
admin.site.register(Type_reference)
admin.site.register(Diametre_corps)
admin.site.register(Longueur_corps)
admin.site.register(Liste_produit)

