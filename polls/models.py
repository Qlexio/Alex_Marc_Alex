from django.db import models

# class Articles(models.Model):
#     type_rivet = models.CharField(max_length = 150, default= None) # rivet plat, fraisé, large
#     diametre_corps = models.FloatField(default= None) # 3.2, 4.0, 4.8, 6.0
#     longueur_corps = models.IntegerField(default= None) # 8, 10, 16, 20


#     def __str__(self):
#         return f"{self.type_rivet}, {self.diametre_corps}, {self.longueur_corps}"

# test
class Reference(models.Model):
    idReference = models.CharField(max_length= 5, primary_key= True)
    libelle = models.CharField(max_length= 50)
    class Meta:
        db_table = "Reference"


class Type_reference(models.Model):
    idType = models.CharField(max_length= 5, primary_key= True)
    libelle = models.CharField(max_length= 50)
    class Meta:
        db_table = "type_reference"


class Longueur_corps(models.Model):
    idLongueurCorps = models.CharField(max_length= 5, primary_key= True)
    longueurCorps = models.FloatField(max_length= 5)
    class Meta:
        db_table = "longueur_corps"


class Diametre_corps(models.Model):
    idDiametreCorps = models.CharField(max_length= 5, primary_key = True)
    diametreCorps = models.FloatField(max_length= 5)
    class Meta:
        db_table = "diametre_corps"


# Class association à revoir la structure
class Liste_produit(models.Model):
    idListe = models.CharField(max_length=5, primary_key = True)
    idReference = models.ForeignKey(Reference, on_delete = models.CASCADE)
    idType = models.ForeignKey(Type_reference, on_delete = models.CASCADE)
    idLongueurCorps = models.ForeignKey(Longueur_corps, on_delete = models.CASCADE)
    idDiametreCorps = models.ForeignKey(Diametre_corps, on_delete = models.CASCADE)
    class Meta:
        db_table = "liste_produit"
