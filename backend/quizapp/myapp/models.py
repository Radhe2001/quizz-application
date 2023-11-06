from django.db import models

# Create your models here.
class UserDetails(models.Model):
    name =models.CharField(max_length=200)
    registrationId=models.CharField(max_length=15)
    email=models.EmailField(max_length=100)
    password=models.CharField(max_length=50)
    
    def __str__(self):
        return self.name
    
    
  
      
class Subject(models.Model):
    subjectName=models.CharField(max_length=100)
    def __str__(self):
        return self.subjectName
 
    
class Question(models.Model):
    question=models.TextField()
    answer=models.TextField()
    option1=models.TextField(max_length=250)
    option2=models.TextField(max_length=250)
    option3=models.TextField(max_length=250)
    option4=models.TextField(max_length=250)
    subject=models.ForeignKey(Subject,on_delete=models.CASCADE,related_name="questions")
    
    def __str__(self):
        return self.question
  
