# Generated by Django 4.0.5 on 2022-06-22 09:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('rivets', '0004_rename_produit_produits_alter_produits_table'),
    ]

    operations = [
        migrations.AlterField(
            model_name='produits',
            name='img_Produit',
            field=models.ImageField(blank=True, null=True, upload_to='images/products'),
        ),
    ]
