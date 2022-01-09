from django.urls import path, include
from . import views as forum_views
# from .views import AddCommentView

urlpatterns = [
    path('forums/', forum_views.forums, name='forums'),
    path('forums/posts/<slug>/', forum_views.posts, name='posts'),
    path('forums/posts/detail/<slug>/', forum_views.detail, name='detail'),
    path('forums/create_post/', forum_views.create_post, name='create_post'),
    path('forums/latest_posts/', forum_views.latest_posts, name='latest_posts'),
    path('search/', forum_views.search_result, name='search_result'),

    path('tinymce/', include('tinymce.urls')),
    path('hitcount/', include('hitcount.urls', namespace='hitcount')),

]
