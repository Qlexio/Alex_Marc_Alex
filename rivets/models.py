from tkinter import Place
from django.db import models

class Type_teinte(models.Model):
    idType = models.IntegerField(primary_key= True)
    libelle = models.CharField(max_length = 50)
    class Meta:
        db_table = "type_teinte"


class Teinte(models.Model):
    idTeinte = models.IntegerField(primary_key= True)
    libelle = models.CharField(max_length = 50)  
    class Meta:
        db_table = "teinte"


class Ral(models.Model):
    idRal = models.IntegerField(primary_key= True)
    idTeinte = models.IntegerField()
    idType = models.IntegerField()
    libelle = models.CharField(max_length= 50)
    code_hex = models.CharField(max_length = 50)
    class Meta:
        db_table = "ral"
    

class Matiere(models.Model):
    idMatiere = models.IntegerField(primary_key = True)
    libelle = models.CharField(max_length = 50)
    class Meta:
        db_table = "matiere"

        def __str__(self):
            return [self.idMatiere , self.libelle]


class Type_reference(models.Model):
    idType = models.IntegerField(primary_key = True)
    libelle = models.CharField(max_length = 50)
    class Meta:
        db_table = "type_reference"

        def __str__(self):
            return [self.idType , self.libelle]


class Longueur_corps(models.Model):
    idLongueurCorps = models.IntegerField(primary_key = True)
    longueurCorps = models.IntegerField()
    class Meta:
        db_table = "longueur_corps"

        def __str__(self):
            return [self.idLongueurCorps , self.longueurCorps]


class Diametre_corps(models.Model):
    idDiametreCorps = models.IntegerField(primary_key = True)
    diametreCorps = models.DecimalField(max_digits=2 , decimal_places=1)
    class Meta:
        db_table = "diametre_corps"

        def __str__(self):
            return [self.idDiametreCorps , self.diametreCorps]


class Rivet(models.Model):
    idRivet = models.IntegerField(primary_key = True)
    idMatiereCorps = models.IntegerField()
    idMatiereTige = models.IntegerField()
    idType = models.IntegerField()
    idDiametreCorps = models.IntegerField()
    idLongueurCorps = models.IntegerField()
    quantite = models.IntegerField()
    prix_brut = models.FloatField()
    prix_peint = models.FloatField()
    class Meta:
        db_table = "rivet"


class Utilisateur(models.Model):
    idUtilisateur = models.IntegerField(primary_key = True)
    nom = models.CharField(max_length = 50)
    prenom = models.CharField(max_length = 50)
    adresse = models.CharField(max_length = 50)
    telephone = models.IntegerField()
    mail = models.CharField(max_length = 50)
    statut = models.CharField(max_length = 50)
    class Meta:
        db_table = "utilisateur"

class Commande(models.Model):
    idCommande = models.IntegerField(primary_key = True)
    class Meta:
        db_table = "commande"


class Vente(models.Model):
    idVente = models.IntegerField(primary_key = True)
    class Meta:
        db_table = "vente"