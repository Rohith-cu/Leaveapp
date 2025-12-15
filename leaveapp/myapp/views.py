from django.shortcuts import render,redirect
from django.contrib.auth import login,logout,authenticate
from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.models import User
from django.contrib import messages
from . models import *
# Create your views here.

def home(request):
    return render(request,'home.html')


def user_login(request):
    if request.method=='POST':
        username=request.POST.get('username')
        password=request.POST.get('password')
        user=authenticate(request,username=username,password=password)
        if user is None:
            messages.info(request,'user not exists')
            return redirect('register')
        if Staff.objects.filter(user=user).exists():
            status=Staff.objects.get(user=user).status
            if status=="approved":
                login(request,user)
                return redirect('viewtask')
            messages.info(request,'waiting for approval')
            return redirect('login')
        else:
            login(request,user)
            messages.info(request,'Login Successful')
            return redirect('viewtask')
    return render(request,'login.html')

def user_register(request):
    if request.method=='POST':
        name=request.POST.get('name')
        classname=request.POST.get('class_name')
        password=request.POST.get('password')
        cpassword=request.POST.get('cpassword')
        username=request.POST.get('username')
        profile=request.FILES.get('profile')
        if User.objects.filter(username=username).exists():
            messages.info(request,'username exists')
            return redirect('login')
        
        else:
            if password == cpassword:             
                user = User.objects.create_user(username=username, password=password)
                user.first_name = name  
                user.save()
                st = Student()
                st.user = user  
                st.name = name
                st.class_name = classname
                st.username = username
                st.password = password  
                if profile:
                    st.profile = profile
                st.save()

                messages.success(request, 'Registration successful! Please login.')
                return redirect('login')

            else:
                messages.error(request, 'Password mismatch')
                return redirect('register')

    return render(request, 'register.html')

def user_logout(request):
    logout(request)
    return redirect('home')

def addtask(request):
    if request.method=='POST':
        task=request.POST.get('task')
        date=request.POST.get('date')
        stud=Student.objects.get(user=request.user)
        li=Todolist()
        li.task=task
        li.due=date
        li.student=stud
        li.save()
        messages.info(request,"Task Added")
        return redirect('viewtask')
    return render(request,'addtask.html')

def viewtask(request):
    if request.user.is_authenticated:
        if Student.objects.filter(user=request.user).exists():
            stud=Student.objects.get(user=request.user)
            li=Todolist.objects.filter(student=stud)
            app=Leaveapp.objects.filter(student=stud)
            return render(request,'viewtask.html',{'li':li,'role':'student','a':app})
        elif Staff.objects.filter(user=request.user).exists():
            staff=Staff.objects.get(user=request.user)
            leave=Leaveapp.objects.all()
            return render(request,'viewtask.html',{'l':leave,'role':"staff"})
        else:
            pass
    return render(request,'viewtask.html')

def delete(request,id):
    de=Todolist.objects.get(id=id)
    de.delete()
    messages.info(request,"Task Deleted")
    return redirect('viewtask')

def complete(request,id):
    co=Todolist.objects.get(id=id)
    co.completed='completed'
    co.save()
    messages.info(request,"Task Marked Complete")
    return redirect('viewtask')

def addleave(request):
    if request.method=='POST':
        date=request.POST.get('date')
        reason=request.POST.get('reason')
        stud=Student.objects.get(user=request.user)
        app=Leaveapp()
        app.date=date
        app.reason=reason
        app.student=stud
        app.save()
        messages.info(request,"Leave Requested")
        return redirect('viewtask')
    return render(request,'addleave.html')


def staffr(request):
    if request.method=='POST':
       name=request.POST.get('name') 
       username=request.POST.get('username') 
       password=request.POST.get('password') 
       repassword=request.POST.get('re_password') 
       if User.objects.filter(username=username).exists():
            messages.info(request,'username exists')
            return redirect('login')
       else:
           if password==repassword:
            stf=Staff()
            stf.name=name
            stf.username=username
            stf.password=password
            user=User.objects.create_user(username=username, password=password)
            user.first_name=name
            user.save()
            stf.user=user
            stf.save()
            messages.info(request,'Registration successful! Please login.')
            return redirect('login')
           else:
               messages.info(request,'incorrect password')
               return redirect('staffr')
    return render(request,'staffregister.html')

def approve(request,id):
    leave=Leaveapp.objects.get(id=id)
    leave.approved='approved'
    leave.save()
    messages.info(request,'Approved')
    return redirect('viewtask')

def reject(request,id):
    leave=Leaveapp.objects.get(id=id)
    leave.delete()
    messages.info(request,'Rejected')
    return redirect('viewtask')

def edit(request,id):
     st=Student.objects.get(user=request.user)
     u=st.user
     if request.method=='POST':
         name=request.POST.get('name')
         classname=request.POST.get('class_name')
         username=request.POST.get('username')
         profile=request.FILES.get('profile')
         st.name=name
         st.class_name=classname
         u.username=username
         u.save()
         st.username=username
         if profile:
             st.profile=profile
         st.save()
         messages.info(request,'Changes Saved')
         return redirect('viewtask')
     return render(request,'editprofile.html',{'st':st})

def change(request, id):
    st = Student.objects.get(id=id)
    user = st.user  

    if request.method == "POST":
        password = request.POST.get("password")

        if not password:
            messages.error(request, "Password cannot be empty.")
            return redirect('change', id=id)

        user.set_password(password)
        user.save()

        
        st.password = password
        st.save()

        
        if request.user == user:
            update_session_auth_hash(request, user)

        messages.success(request, "Password changed successfully. Please log in again.")
        return redirect('login')

    return render(request, "change.html", {'st': st})

