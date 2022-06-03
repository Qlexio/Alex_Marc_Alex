from django.contrib import admin

from rivets.models import Matiere, Ral,Teinte, Type_reference, Longueur_corps, Rivet, Diametre_corps

admin.site.register(Teinte)
admin.site.register(Ral)
admin.site.register(Matiere)
admin.site.register(Type_reference)
admin.site.register(Diametre_corps)
admin.site.register(Longueur_corps)
admin.site.register(Rivet)

