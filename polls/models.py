from django.db import models

class articles(models.Model):
    article = models.CharField(max_length = 150)

    def __str__(self):
        return self.article
