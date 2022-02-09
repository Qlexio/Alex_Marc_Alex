from django.db import models

# class Articles(models.Model):
#     type_rivet = models.CharField(max_length = 150, default= None) # rivet plat, fraisé, large
#     diametre_corps = models.FloatField(default= None) # 3.2, 4.0, 4.8, 6.0
#     longueur_corps = models.IntegerField(default= None) # 8, 10, 16, 20


#     def __str__(self):
#         return f"{self.type_rivet}, {self.diametre_corps}, {self.longueur_corps}"

# integer en id
class Matiere_corps(models.Model):
    idMatiereCorps = models.IntegerField(primary_key = True)
    matiereCorps = models.CharField(max_length = 50)
    class Meta:
        db_table = "matiere_corps"


class Matiere_tige(models.Model):
    idMatiereTige = models.IntegerField(primary_key = True)
    matiereTige = models.CharField(max_length = 50)
    class Meta:
        db_table = "matiere_tige"


class Reference(models.Model):
    idReference = models.IntegerField(primary_key = True)
    libelle = models.CharField(max_length = 50)
    idMatiereCorps = models.IntegerField()
    idMatiereTige = models.IntegerField()
    class Meta:
        db_table = "reference"


class Type_reference(models.Model):
    idType = models.IntegerField(primary_key = True)
    libelle = models.CharField(max_length = 50)
    class Meta:
        db_table = "type_reference"


class Longueur_corps(models.Model):
    idLongueurCorps = models.IntegerField(primary_key = True)
    longueurCorps = models.FloatField(max_length = 5)
    class Meta:
        db_table = "longueur_corps"


class Diametre_corps(models.Model):
    idDiametreCorps = models.IntegerField(primary_key = True)
    diametreCorps = models.FloatField(max_length = 5)
    class Meta:
        db_table = "diametre_corps"


# Class association à revoir la structure
class Liste_produit(models.Model):
    idListe = models.IntegerField(primary_key = True)
    idReference = models.IntegerField()
    idType = models.IntegerField()
    idDiametreCorps = models.IntegerField()
    idLongueurCorps = models.IntegerField()
    
    class Meta:
        db_table = "liste_produit"
