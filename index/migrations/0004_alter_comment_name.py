# Generated by Django 3.2.3 on 2021-09-09 12:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('index', '0003_comment'),
    ]

    operations = [
        migrations.AlterField(
            model_name='comment',
            name='name',
            field=models.CharField(max_length=255),
        ),
    ]
