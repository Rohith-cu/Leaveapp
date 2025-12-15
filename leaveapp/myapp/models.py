from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Student(models.Model):
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    name=models.CharField(max_length=100,null=True,blank=True)
    class_name=models.CharField(max_length=100,null=True,blank=True)
    password=models.CharField(max_length=100,null=True,blank=True)
    username=models.EmailField(null=True,blank=True)
    profile=models.ImageField(upload_to='media',null=True,blank=True)

    def __str__(self):
        return self.name
    
class Todolist(models.Model):
    student=models.ForeignKey(Student,on_delete=models.CASCADE)    
    task=models.CharField(max_length=100,null=True,blank=True)
    due=models.DateField(null=True,blank=True)
    completed=models.CharField(default='pending',max_length=100,null=True,blank=True)

    def __str__(self):
        return self.task

class Leaveapp(models.Model):
    student=models.ForeignKey(Student,on_delete=models.CASCADE)
    date=models.DateField(null=True,blank=True)
    reason=models.CharField(max_length=100,null=True,blank=True)
    approved=models.CharField(max_length=100,default='pending',null=True,blank=True)

    def __str__(self):
        return self.student.name
class Staff(models.Model):
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    name=models.CharField(max_length=100,null=True,blank=True)
    username=models.EmailField(null=True,blank=True)
    password=models.CharField(max_length=100,null=True,blank=True)
    status=models.CharField(max_length=100,default='pending',null=True,blank=True)
    
    def __str__(self):
        return self.name