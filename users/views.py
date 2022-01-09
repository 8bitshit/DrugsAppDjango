from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from django.contrib import messages

from forum.models import Post
from index.models import Drugs
from .forms import UserRegisterForm, UpdateUserForm, UpdateImageForm
from django.contrib.auth.decorators import login_required


# Create your views here.


def register(request):
    if request.method == 'POST':
        form = UserRegisterForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            messages.success(request, f'Utworzono konto dla użytkownika {username}! Możesz zalogować się na swoje konto')
            return redirect('login')
    else:
        form = UserRegisterForm()
    return render(request, 'users/register.html', {'form': form})

@ login_required()
def profile(request):
    if request.method == 'POST':
        u_form = UpdateUserForm(request.POST, instance=request.user)
        i_form = UpdateImageForm(request.POST,request.FILES, instance=request.user.profile)

        if u_form.is_valid() and i_form.is_valid():
            u_form.save()
            i_form.save()
            messages.success(request, f'Twój profil został zaktualizowany!')
            return redirect('profile')

    else:
        u_form = UpdateUserForm(instance=request.user)
        i_form = UpdateImageForm(instance=request.user.profile)

    fav_drug = Drugs.objects.filter(favourites=request.user)

    posts = Post.objects.all().filter(approved=True)[:10]


    context = {
        'u_form': u_form,
        'i_form': i_form,
        'fav_drug': fav_drug,
        "posts": posts
    }

    return render(request, 'users/profile.html', context)

