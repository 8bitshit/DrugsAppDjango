from django.urls import path
from . import views
# from .views import AddCommentView

urlpatterns = [
    path('', views.home, name='index-home'),
    path('search_results/', views.search_results, name='search-results'),
    path('search_results/<int:pk>/comments', views.add_comment, name='comments'),
    path('fav/<int:pk>/', views.favourite_add, name='favourite_add'),
    path('profile/favourites/', views.favourite_list, name='favourite_list'),

]
