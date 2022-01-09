# Generated by Django 3.2.3 on 2021-09-17 14:31

from django.db import migrations, models
import taggit.managers
import tinymce.models


class Migration(migrations.Migration):

    dependencies = [
        ('taggit', '0003_taggeditem_add_unique_index'),
        ('forum', '0003_auto_20210915_1706'),
    ]

    operations = [
        migrations.AddField(
            model_name='post',
            name='closed',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='post',
            name='content',
            field=tinymce.models.HTMLField(default=None),
        ),
        migrations.AddField(
            model_name='post',
            name='state',
            field=models.CharField(default='zero', max_length=40),
        ),
        migrations.AddField(
            model_name='post',
            name='tags',
            field=taggit.managers.TaggableManager(help_text='A comma-separated list of tags.', through='taggit.TaggedItem', to='taggit.Tag', verbose_name='Tags'),
        ),
    ]
