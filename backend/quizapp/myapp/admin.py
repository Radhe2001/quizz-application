from django.contrib import admin
from .models import UserDetails,Subject,Question


# Register your models here.
admin.site.register(UserDetails)
admin.site.register(Subject)
admin.site.register(Question)