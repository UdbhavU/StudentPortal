# Generated by Django 3.1.3 on 2021-01-10 17:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('forum', '0005_posts_no_of_comments'),
    ]

    operations = [
        migrations.AddField(
            model_name='posts',
            name='edited',
            field=models.BooleanField(default=False),
        ),
    ]
