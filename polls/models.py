from django.db import models


class Teinte(models.Model):
    idTeinte = models.IntegerField(primary_key= True)
    libelle = models.CharField(max_length = 50)  
    class Meta:
        db_table = "teinte"


class Ral(models.Model):
    idRal = models.IntegerField(primary_key= True)
    idTeinte = models.IntegerField()
    numeroRal = models.IntegerField()
    class Meta:
        db_table = "ral"
    

class Matiere(models.Model):
    idMatiereCorps = models.IntegerField(primary_key = True)
    matiereCorps = models.CharField(max_length = 50)
    class Meta:
        db_table = "matiere"


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


class Rivet(models.Model):
    idListe = models.IntegerField(primary_key = True)
    idMatiereCorps = models.IntegerField()
    idMatiereTige = models.IntegerField()
    idType = models.IntegerField()
    idDiametreCorps = models.IntegerField()
    idLongueurCorps = models.IntegerField()
    quantite = models.IntegerField()
    prix = models.FloatField()
    class Meta:
        db_table = "rivet"
