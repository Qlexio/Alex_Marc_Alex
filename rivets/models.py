from pyexpat import model
from tkinter import Place
from django.db import models
from django.core.files.storage import FileSystemStorage
from django.urls import reverse

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
    def __str__(self):
            return f"{self.idRivet} ({self.quantite})"
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





# fs = FileSystemStorage(location='/photos')


class Category(models.Model):
    id_Produit = models.IntegerField(primary_key = True)
    slug=models.SlugField(max_length= 128)
    nom_Produit = models.CharField(max_length = 50)
    img_Produit = models.ImageField(upload_to ="products", blank = True, null=True)
    def __str__(self):
        return self.nom_Produit
    def get_absolute_url(self):
        return reverse("produit", kwargs= {"slug": self.slug} )

    class Meta:
        db_table = "Produits"


class Products(models.Model):
    name = models.CharField(max_length=60)
    price = models.IntegerField(default=0)
    category = models.ForeignKey(Category, on_delete=models.CASCADE, default=1)
    description = models.CharField(
        max_length=250, default='', blank=True, null=True)
    image = models.ImageField(upload_to='uploads/products/')
  
    @staticmethod
    def get_products_by_id(ids):
        return Products.objects.filter(id__in=ids)
  
    @staticmethod
    def get_all_products():
        return Products.objects.all()
  
    @staticmethod
    def get_all_products_by_categoryid(category_id):
        if category_id:
            return Products.objects.filter(category=category_id)
        else:
            return Products.get_all_products()





