from django.forms import ModelForm
from .models import Comment
from django import forms


class CommentForm(ModelForm):
    class Meta:
        model = Comment
        fields = ['body']

        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control'}),
            'body': forms.Textarea(attrs={'class': 'form-control'}),
        }


# class FavsForm(ModelForm):
#     class Meta:
#         model = Fav
#         fields = []
#
#         widgets = {
#             'drug': forms.TextInput(attrs={'class': 'form-control'}),
#             'name': forms.TextInput(attrs={'class': 'form-control'}),
#         }
