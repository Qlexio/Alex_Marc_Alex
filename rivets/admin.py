from django.contrib import admin
# from Alex_Marc_Alex.rivets.models import Category
# from Alex_Marc_Alex.rivets.models import Produit

from rivets.models import Matiere, Ral,Teinte, Type_reference, Longueur_corps, Rivet, Diametre_corps,Category,Products,Order,Cart


admin.site.register(Teinte)
admin.site.register(Ral)
admin.site.register(Matiere)
admin.site.register(Type_reference)
admin.site.register(Diametre_corps)
admin.site.register(Longueur_corps)
admin.site.register(Rivet)
admin.site.register(Category)
admin.site.register(Products)
admin.site.register(Order)
admin.site.register(Cart)

