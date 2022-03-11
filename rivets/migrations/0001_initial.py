# Generated by Django 4.0.2 on 2022-03-11 14:59

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        # migrations.CreateModel(
        #     name='Commande',
        #     fields=[
        #         ('idCommande', models.IntegerField(primary_key=True, serialize=False)),
        #     ],
        #     options={
        #         'db_table': 'commande',
        #     },
        # ),
        # migrations.CreateModel(
        #     name='Diametre_corps',
        #     fields=[
        #         ('idDiametreCorps', models.IntegerField(primary_key=True, serialize=False)),
        #         ('diametreCorps', models.DecimalField(decimal_places=1, max_digits=2)),
        #     ],
        #     options={
        #         'db_table': 'diametre_corps',
        #     },
        # ),
        # migrations.CreateModel(
        #     name='Longueur_corps',
        #     fields=[
        #         ('idLongueurCorps', models.IntegerField(primary_key=True, serialize=False)),
        #         ('longueurCorps', models.IntegerField()),
        #     ],
        #     options={
        #         'db_table': 'longueur_corps',
        #     },
        # ),
        # migrations.CreateModel(
        #     name='Matiere',
        #     fields=[
        #         ('idMatiere', models.IntegerField(primary_key=True, serialize=False)),
        #         ('libelle', models.CharField(max_length=50)),
        #     ],
        #     options={
        #         'db_table': 'matiere',
        #     },
        # ),
        # migrations.CreateModel(
        #     name='Ral',
        #     fields=[
        #         ('idRal', models.IntegerField(primary_key=True, serialize=False)),
        #         ('idTeinte', models.IntegerField()),
        #         ('idType', models.IntegerField()),
        #         ('libelle', models.CharField(max_length=50)),
        #         ('code_hex', models.CharField(max_length=50)),
        #     ],
        #     options={
        #         'db_table': 'ral',
        #     },
        # ),
        # migrations.CreateModel(
        #     name='Rivet',
        #     fields=[
        #         ('idRivet', models.IntegerField(primary_key=True, serialize=False)),
        #         ('idMatiereCorps', models.IntegerField()),
        #         ('idMatiereTige', models.IntegerField()),
        #         ('idType', models.IntegerField()),
        #         ('idDiametreCorps', models.IntegerField()),
        #         ('idLongueurCorps', models.IntegerField()),
        #         ('quantite', models.IntegerField()),
        #         ('prix_brut', models.FloatField()),
        #         ('prix_peint', models.FloatField()),
        #     ],
        #     options={
        #         'db_table': 'rivet',
        #     },
        # ),
        # migrations.CreateModel(
        #     name='Teinte',
        #     fields=[
        #         ('idTeinte', models.IntegerField(primary_key=True, serialize=False)),
        #         ('libelle', models.CharField(max_length=50)),
        #     ],
        #     options={
        #         'db_table': 'teinte',
        #     },
        # ),
        # migrations.CreateModel(
        #     name='Type_reference',
        #     fields=[
        #         ('idType', models.IntegerField(primary_key=True, serialize=False)),
        #         ('libelle', models.CharField(max_length=50)),
        #     ],
        #     options={
        #         'db_table': 'type_reference',
        #     },
        # ),
        # migrations.CreateModel(
        #     name='Type_teinte',
        #     fields=[
        #         ('idType', models.IntegerField(primary_key=True, serialize=False)),
        #         ('libelle', models.CharField(max_length=50)),
        #     ],
        #     options={
        #         'db_table': 'type_teinte',
        #     },
        # ),
        # migrations.CreateModel(
        #     name='Utilisateur',
        #     fields=[
        #         ('idUtilisateur', models.IntegerField(primary_key=True, serialize=False)),
        #         ('nom', models.CharField(max_length=50)),
        #         ('prenom', models.CharField(max_length=50)),
        #         ('adresse', models.CharField(max_length=50)),
        #         ('telephone', models.IntegerField()),
        #         ('mail', models.CharField(max_length=50)),
        #         ('statut', models.CharField(max_length=50)),
        #     ],
        #     options={
        #         'db_table': 'utilisateur',
        #     },
        # ),
        # migrations.CreateModel(
        #     name='Vente',
        #     fields=[
        #         ('idVente', models.IntegerField(primary_key=True, serialize=False)),
        #     ],
        #     options={
        #         'db_table': 'vente',
        #     },
        # ),
    ]