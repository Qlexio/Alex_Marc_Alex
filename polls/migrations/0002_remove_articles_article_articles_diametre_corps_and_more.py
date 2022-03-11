# Generated by Django 4.0.1 on 2022-01-28 14:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='articles',
            name='article',
        ),
        migrations.AddField(
            model_name='articles',
            name='diametre_corps',
            field=models.FloatField(default=None),
        ),
        migrations.AddField(
            model_name='articles',
            name='longueur_corps',
            field=models.IntegerField(default=None),
        ),
        migrations.AddField(
            model_name='articles',
            name='type_rivet',
            field=models.CharField(default=None, max_length=150),
        ),
    ]