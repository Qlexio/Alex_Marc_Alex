# Generated by Django 4.0.5 on 2022-06-23 08:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('rivets', '0005_alter_produits_img_produit'),
    ]

    operations = [
        migrations.AddField(
            model_name='produits',
            name='slug',
            field=models.SlugField(default='', max_length=128),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='produits',
            name='img_Produit',
            field=models.ImageField(blank=True, null=True, upload_to='products'),
        ),
    ]