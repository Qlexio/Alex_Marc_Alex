from django.db import models


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
    class Meta:
        db_table = "reference"


class Type_reference(models.Model):
    idType = models.IntegerField(primary_key = True)
    libelle = models.CharField(max_length = 50)
    class Meta:
        db_table = "type_reference"


class Longueur_corps(models.Model):
    idLongueurCorps = models.IntegerField(primary_key = True)
    longueurCorps = models.FloatField()
    class Meta:
        db_table = "longueur_corps"


class Diametre_corps(models.Model):
    idDiametreCorps = models.IntegerField(primary_key = True)
    diametreCorps = models.FloatField()
    class Meta:
        db_table = "diametre_corps"


class Liste_produit(models.Model):
    idListe = models.IntegerField(primary_key = True)
    idMatiereCorps = models.IntegerField()
    idMatiereTige = models.IntegerField()
    idReference = models.IntegerField()
    idType = models.IntegerField()
    idDiametreCorps = models.IntegerField()
    idLongueurCorps = models.IntegerField()
    couleur = models.CharField(max_length = 50)
    quantite = models.IntegerField()
    prix = models.FloatField()
    class Meta:
        db_table = "liste_produit"
