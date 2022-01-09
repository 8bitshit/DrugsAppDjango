from datetime import datetime
from django.contrib import messages
from django.shortcuts import render, redirect, get_object_or_404
from django.views.generic import CreateView
from .forms import CommentForm
from .models import Drugs, Comment
from django.contrib.postgres.search import SearchQuery, SearchVector, SearchRank, SearchHeadline
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.contrib.auth.decorators import login_required
from django.db.models import Q


# Create your views here.
def home(request):
    if 'term' in request.GET:
        qs = Drugs.objects.filter(Q(drugname__icontains=request.GET.get('term')) | Q(drugingredients__icontains=request.GET.get('term')))
        dnames = list()
        for dname in qs:
            dnames.append(dname.drugname)
        # names = [product.name for product in qs]
        return JsonResponse(dnames, safe=False)
    return render(request, 'index/index.html')
    #return HttpResponse('<h1>Strona Główna</h1>')


def search_results(request):

    q = request.GET.get('q')
    q1 = request.GET.get('q1')
    q2 = request.GET.get('q2')
    qcontains = request.GET.get('qcontains')


    if q:
        vector = SearchVector('drugname', 'drugingredients', 'drugindications')
        query = SearchQuery(q)
        search_headline = SearchHeadline('drugindications', query)
        # drugs = Drugs.objects.filter(drugname__search = q)
        # drugs = Drugs.objects.annotate(search=vector).filter(search=query)
        # drugs = Drugs.objects.annotate(rank = SearchRank(vector, query)).filter(rank__gte=0.001).order_by('-rank')
        drugs = Drugs.objects.annotate(rank=SearchRank(vector, query)).annotate(headline = search_headline).filter(rank__gte=0.001).order_by('-rank')
    else:
        if qcontains:
            drugs = Drugs.objects.all()
            # qcontains = request.GET.get('qcontains')
            # if qcontains != '' and qcontains is not None:
            drugs = drugs.filter(Q(drugname__icontains=request.GET.get('qcontains')) | Q(drugingredients__icontains=request.GET.get('qcontains')))
        else:
            if q1 and q2:
                vector1 = SearchVector('drugindications', config='polish')
                query1 = SearchQuery(q1, config='polish')

                vector2 = SearchVector('drugwarnings', config='polish')
                query2 = SearchQuery(q2, config='polish')
                search_headline = SearchHeadline('drugindications', query1)
                # drugs = Drugs.objects.filter(drugname__search = q)
                # drugs = Drugs.objects.annotate(search=vector).filter(search=query)
                # drugs = Drugs.objects.annotate(rank = SearchRank(vector, query)).filter(rank__gte=0.001).order_by('-rank')
                drugs = Drugs.objects.annotate(rank=SearchRank(vector1, query1)).annotate(headline=search_headline).filter(rank__gte=0.001).order_by('-rank')
                drugs = drugs.annotate(rank1=SearchRank(vector2, query2)).annotate(headline=search_headline).filter(rank1__lte=0.001).order_by('-rank')

            elif q1:

                vector1 = SearchVector('drugindications', config='polish')
                query1 = SearchQuery(q1, config='polish')

                search_headline = SearchHeadline('drugindications', query1)
                # drugs = Drugs.objects.filter(drugname__search = q)
                # drugs = Drugs.objects.annotate(search=vector).filter(search=query)
                # drugs = Drugs.objects.annotate(rank = SearchRank(vector, query)).filter(rank__gte=0.001).order_by('-rank')
                drugs = Drugs.objects.annotate(rank=SearchRank(vector1, query1)).annotate(headline=search_headline).filter(rank__gte=0.001).order_by('-rank')

            # elif q2:
            #
            #     vector2 = SearchVector('drugindications', config='polish')
            #     query2 = SearchQuery(q2, config='polish')
            #     search_headline = SearchHeadline('drugindications', query2)
            #     # drugs = Drugs.objects.filter(drugname__search = q)
            #     # drugs = Drugs.objects.annotate(search=vector).filter(search=query)
            #     # drugs = Drugs.objects.annotate(rank = SearchRank(vector, query)).filter(rank__gte=0.001).order_by('-rank')
            #     drugs = Drugs.objects.annotate(rank1=SearchRank(vector2, query2)).annotate(headline=search_headline).filter(rank1__gte=0.001).order_by('-rank1')

            else:
                drugs = None
            # drugs = Drugs.objects.all()




    context = {'drugs': drugs,
                }
    return render(request, 'index/search_results.html', context)



# class AddCommentView(CreateView):
#     model = Comment
#     #form_class = PostForm
#     template_name = 'search_results.html'
#     fields = '__all__'



@ login_required()
def add_comment(request, pk):
    drug = Drugs.objects.get(id=pk)

    form = CommentForm(instance=drug)

    if request.method == 'POST':
        form = CommentForm(request.POST, instance=drug)
        if form.is_valid():
            name = request.user
            body = form.cleaned_data['body']

            c = Comment(drug=drug, name=name, body=body, date_added=datetime.now())
            c.save()
            messages.success(request, f'Pomyślnie dodano komentarz do {drug}!')
            return redirect('search-results')
        else:
            print('Formularz nie jest wypełniony poprawnie!')
    else:
        form = CommentForm()

    context = {
        'form': form
    }

    return render(request, 'comments.html', context)
    # return HttpResponseRedirect(request.META['HTTP_REFERER'])

# def add_to_favs(request, pk):
#     drug = Drugs.objects.get(id=pk)
#     if drug.favourite.filter(id=request.user.id).exists():
#         drug.favourite.remove(request.user)
#     else:
#         drug.favourite.add(request.user)

@ login_required()
def favourite_add(request, pk):
    drug = get_object_or_404(Drugs, id=pk)
    if drug.favourites.filter(id=request.user.id).exists():
        drug.favourites.remove(request.user)
    else:
        drug.favourites.add(request.user)
    return HttpResponseRedirect(request.META['HTTP_REFERER'])



@login_required()
def favourite_list(request):
    fav_drug = Drugs.objects.filter(favourites = request.user)
    context = {
        'fav_drug': fav_drug
    }

    return render(request, 'users/favourites.html', context)