import os
from django.core.wsgi import get_wsgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'GFIX.settings')
application = get_wsgi_application()

from polls.models import Liste_produit
# , Reference, Type_reference,
#     Diametre_corps, Longueur_corps)


liste_produits = Liste_produit.objects.all().values("idReference", "idType", "idDiamietre").order_by("idReference", "idType")

print(liste_produits)