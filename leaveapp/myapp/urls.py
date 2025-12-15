from django.urls import path,include
from . import views

urlpatterns = [
    path('',views.home,name='home'),
    path('login/',views.user_login,name='login'),
    path('register/',views.user_register,name='register'),
    path('logout/',views.user_logout,name='logout'),
    path('addtask/',views.addtask,name='addtask'),
    path('viewtask/',views.viewtask,name='viewtask'),
    path('delete/<int:id>/',views.delete,name='delete'),
    path('complete/<int:id>/',views.complete,name='complete'),
    path('addleave/',views.addleave,name='addleave'),
    path('staffr/',views.staffr,name='staffr'),
    path('reject/<int:id>/',views.reject,name='reject'),
    path('approve/<int:id>/',views.approve,name='approve'),
    path('edit/<int:id>/',views.edit,name='edit'),
    path('change/<int:id>/',views.change,name='change')
    
   
    
]

