from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from .models import Profile


class UserRegisterForm(UserCreationForm):
    email = forms.EmailField()

    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']

# uaktualnia nazwę użytkownika i email
class UpdateUserForm(forms.ModelForm):
    email = forms.EmailField()

    class Meta:
        model = User
        fields = ['username', 'email']

# uaktualnia zdjęcie profilowe użytkownika
class UpdateImageForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ['image']

