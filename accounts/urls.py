from django.urls import path, include
from django.conf.urls import url
from. import views
from django.contrib import admin


from accounts import views as user_views
from django.contrib.auth import views as auth_views
from django.conf.urls.static import static
from .views import (
    PostListView,
    PostDetailView,
    PostCreateView,
    PostUpdateView,
    PostDeleteView,
    MyPost
)



urlpatterns=[
     path('admin/', admin.site.urls),

     path('register/',views.register, name='register'),
     path('customer_register/',views.customer_register.as_view(), name='customer_register'),
     path('employee_register/',views.employee_register.as_view(), name='employee_register'),
     path('login/',views.login_request, name='login'),
     path('logout/',views.logout_view, name='logout'),
     path('profile/',views.profile, name='profile'),
     path('edit_profile/',views.customer_update.as_view(), name='edit_profile'),
     path('userprofile/<int:id>/',views.userprofile, name='userprofile'),

    path('', PostListView.as_view(), name='blog-home'),
    path('mypost/',views.MyPost, name='mypost'),
    path('post/<int:pk>/', PostDetailView.as_view(), name='post-detail'),
    path('bid_request/', views.BidRequest, name='bid_request'),

    path('post/new/', PostCreateView.as_view(), name='post-create'),
    path('post/<int:pk>/update/', PostUpdateView.as_view(), name='post-update'),
    path('post/<int:pk>/delete/', PostDeleteView.as_view(), name='post-delete'),
    path('send_friend_request/<int:id>/<int:postID>/',views.send_friend_request, name='send_friend_request'),
    path('accept_friend_request/<int:a_id>/<int:post_a>/',views.accept_friend_request, name='accept_friend_request'),
    path('accepted/', views.accept_request, name='accept_request'),
    path('orderhistory/', views.order_history, name='order_history'),
    path('post_notification/', views.notification, name='notification'),
    path('field/', views.jobField, name='jobField'),
    path('field2/', views.jobField2, name='jobField2'),
    path('field3/', views.jobField3, name='jobField3'),
    path('date/', views.date_posted, name='date_posted'),
    path('like/<int:post_Id_r>/<int:from_id>/<int:lik>/',views.like, name='like'),
    path('review/<int:id>/', views.review, name='review'),
    path('contact/', views.contact, name='contact'),
    path('about/', views.about, name='about'),

    ]
