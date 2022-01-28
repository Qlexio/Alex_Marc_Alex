from django import forms
from django.forms import ModelForm 
from .models import articles

class articlesForm(forms.Form):
     LesArticles = forms.CharField(label = 'type1', max_length=100)


class articlesForm2(ModelForm):
     class Meta:
          model = articles
          fields = ['article']


