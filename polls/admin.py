from django.contrib import admin

from .models import Matiere, Ral,Teinte, Type_reference, Diametre_corps, Longueur_corps, Rivet

admin.site.register(Teinte)
admin.site.register(Ral)
admin.site.register(Matiere)
admin.site.register(Type_reference)
admin.site.register(Diametre_corps)
admin.site.register(Longueur_corps)
admin.site.register(Rivet)

