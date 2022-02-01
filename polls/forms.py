from dataclasses import fields
from django import forms
from django.forms import ModelForm 
from .models import Articles


class Test1(forms.ModelForm):
     class Meta:
          model = Articles
          fields = forms.ModelChoiceIterator(queryset= Articles.objects.all())
          fields = ["type_rivet"]
     elements1 = Articles.objects.all()

# class articlesForm(forms.Form):
#      LesArticles = forms.CharField(label = 'type1', max_length=100)


# class articlesForm2(ModelForm):
#      class Meta:
#           model = articles
#           fields = ['article']


