# Generated by Django 4.2.5 on 2023-10-27 06:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0003_option_question_result_subject_userdetails_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='question',
            name='answer',
            field=models.TextField(default=''),
            preserve_default=False,
        ),
    ]
