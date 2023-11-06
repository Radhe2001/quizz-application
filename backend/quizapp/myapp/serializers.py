from rest_framework import serializers
from .models import UserDetails,Subject,Question


class UserSerializers(serializers.ModelSerializer):
    class Meta:
        model = UserDetails
        fields="__all__"
        
   
    
        
        
class QuestionSerializers(serializers.ModelSerializer):
    class Meta:
        model = Question
        fields='__all__'
    
class SubjectSerializers(serializers.ModelSerializer):
    question=QuestionSerializers(many=True,read_only=True)
    class Meta:
        model = Subject
        fields="__all__"
    
         