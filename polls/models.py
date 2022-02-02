from django.db import models

# class Articles(models.Model):
#     type_rivet = models.CharField(max_length = 150, default= None) # rivet plat, fraisé, large
#     diametre_corps = models.FloatField(default= None) # 3.2, 4.0, 4.8, 6.0
#     longueur_corps = models.IntegerField(default= None) # 8, 10, 16, 20


#     def __str__(self):
#         return f"{self.type_rivet}, {self.diametre_corps}, {self.longueur_corps}"


class Reference(models.Model):
    idReference = models.CharField(max_length= 50, primary_key= True)
    libelle = models.CharField(max_length= 50)
    class Meta:
        db_table = "Reference"


class Type_reference(models.Model):
    idType = models.CharField(max_length= 50, primary_key= True)
    libelle = models.CharField(max_length= 50)
    class Meta:
        db_table = "type_reference"


class Longueur_corps(models.Model):
    idLongueurCorps = models.CharField(max_length= 50, primary_key= True)
    longueurCorps = models.FloatField(max_length= 5)
    class Meta:
        db_table = "longueur_corps"


class Diametre_corps(models.Model):
    idDiametreCorps = models.CharField(max_length= 50, primary_key= True)
    diametreCorps = models.FloatField(max_length= 5)
    class Meta:
        db_table = "diametre_corps"


# Class association
class Liste_produit(models.Model):
    idReference = models.CharField(max_length= 50)
    idType = models.CharField(max_length= 50)
    idLongueurCorps = models.CharField(max_length= 50)
    idDiametreCorps = models.CharField(max_length= 50)
    class Meta:
        db_table = "liste_produit"
