# Generated by Django 4.0.5 on 2022-06-30 15:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('rivets', '0014_remove_products_description_category_is_active_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='products',
            name='slug',
            field=models.SlugField(default='', max_length=128),
        ),
    ]
