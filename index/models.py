# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from django.contrib.auth.models import User


class Drugs(models.Model):
    drugname = models.CharField(unique=True, max_length=255)
    drugingredients = models.CharField(max_length=255, blank=True, null=True)
    drugindications = models.CharField(max_length=255, blank=True, null=True)
    drugdosage = models.CharField(max_length=255, blank=True, null=True)
    drugcontrindications = models.CharField(max_length=255, blank=True, null=True)
    drugwarnings = models.CharField(max_length=255, blank=True, null=True)
    druginteractions = models.CharField(max_length=255, blank=True, null=True)
    drugpregnancy = models.CharField(max_length=255, blank=True, null=True)
    drugadverse = models.CharField(max_length=255, blank=True, null=True)
    drugoverdose = models.CharField(max_length=255, blank=True, null=True)
    drugaction = models.CharField(max_length=255, blank=True, null=True)
    favourites = models.ManyToManyField(User, related_name='favourite', default=None, blank=True)

    objects = models.Manager()

    def __str__(self):
        return '%s' % self.drugname

    class Meta:
        managed = False
        db_table = 'drugs'


class Post(models.Model):
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    body = models.TextField()

    def __str__(self):
        return self.author


class Comment(models.Model):
    drug = models.ForeignKey(Drugs, related_name="comments", on_delete=models.CASCADE)
    name = models.ForeignKey(User, on_delete=models.CASCADE) #models.CharField(max_length=255)
    body = models.TextField(verbose_name="")
    date_added = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-date_added']

    def __str__(self):
        return '%s - %s' % (self.drug.drugname, self.name)


# class Fav(models.Model):
#     drug = models.ForeignKey(Drugs, related_name="favourite", on_delete=models.CASCADE)
#     name = models.ForeignKey(User, on_delete=models.CASCADE)  # models.CharField(max_length=255)
#
#     class Meta:
#         ordering = ['drug']
#
#     def __str__(self):
#         return '%s - %s' % (self.drug.drugname, self.name)