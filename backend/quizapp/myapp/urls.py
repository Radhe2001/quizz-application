from django.contrib import admin
from django.urls import path,include
from .views import getQuestion,StudentGetCreate,studentDetails,SubjectGetCreate



urlpatterns = [
    path('student/',StudentGetCreate.as_view()),
    path('student/<str:reg>/',studentDetails),
    path('subject/',SubjectGetCreate.as_view()),
    path('subject/<int:sub>/question/',getQuestion),

]
