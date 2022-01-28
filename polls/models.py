from django.db import models

class Articles(models.Model):
    type_rivet = models.CharField(max_length = 150, default= None) # rivet plat, fraisé, large
    diametre_corps = models.FloatField(default= None) # 3.2, 4.0, 4.8, 6.0
    longueur_corps = models.IntegerField(default= None) # 8, 10, 16, 20


    def __str__(self):
        return f"{self.type_rivet}, {self.diametre_corps}, {self.longueur_corps}"
