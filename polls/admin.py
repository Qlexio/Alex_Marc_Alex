from django.contrib import admin

from .models import Matiere_corps, Matiere_tige,Reference, Type_reference, Diametre_corps, Longueur_corps, Liste_produit

admin.site.register(Matiere_corps)
admin.site.register(Matiere_tige)
admin.site.register(Reference)
admin.site.register(Type_reference)
admin.site.register(Diametre_corps)
admin.site.register(Longueur_corps)
admin.site.register(Liste_produit)

