import json
from django.shortcuts import render
from rest_framework import generics
from .models import UserDetails,Question,Subject
from .serializers import UserSerializers,QuestionSerializers,SubjectSerializers
from rest_framework.decorators import api_view
from rest_framework.response import Response


# Create your views here.

# to create a new object
class StudentGetCreate(generics.ListCreateAPIView):
    queryset=UserDetails.objects.all()
    serializer_class=UserSerializers
  
  
@api_view(['GET'])
def studentDetails(request,reg):
    if request.method == 'GET':
        # Handle GET request
        obj = UserDetails.objects.filter(registrationId=reg)
        serializer=UserSerializers(obj,many=True)
        return Response(serializer.data)
  
# to retrieve , update, delete objects
class StudentGetUpdateDelete(generics.RetrieveUpdateDestroyAPIView):
    queryset=UserDetails.objects.all()
    serializer_class=UserSerializers
    
    
class SubjectGetCreate(generics.ListCreateAPIView):
    queryset=Subject.objects.all()
    serializer_class=SubjectSerializers
    

@api_view(['GET'])
def getQuestion(request,sub):
    if request.method == 'GET':
        # Handle GET request
        obj = Question.objects.filter(subject=sub)
        serializer=QuestionSerializers(obj,many=True)
        return Response(serializer.data)

    
    