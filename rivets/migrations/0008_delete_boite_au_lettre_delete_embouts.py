# Generated by Django 4.0.5 on 2022-06-23 14:04

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rivets', '0007_boite_au_lettre_embouts'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Boite_au_Lettre',
        ),
        migrations.DeleteModel(
            name='EMBOUTS',
        ),
    ]
