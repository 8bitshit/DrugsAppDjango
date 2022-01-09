from django.contrib import admin

from .models import Post, Drugs, Comment #Author
from users.models import Profile
# Register your models here.

admin.site.register(Post)
admin.site.register(Comment)
admin.site.register(Profile)
# admin.site.register(Author)