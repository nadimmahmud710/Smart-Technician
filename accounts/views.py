from django.contrib.auth import login, logout,authenticate
from django.shortcuts import redirect, render, get_object_or_404
from django.contrib import messages
from django.views.generic import CreateView
from accounts.forms import CustomerSignUpForm,EmployeeSignUpForm,CustomerEditForm
from django.contrib.auth.forms import AuthenticationForm,UserCreationForm,UserChangeForm
from accounts.models import User
from .models import Customer,Employee,Friend_Request,Friend,Review

from django.conf import settings
from django.http import HttpResponse
from django.contrib.auth import get_user_model
from django.shortcuts import get_object_or_404

import random


from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.views.generic import (
    ListView,
    DetailView,
    CreateView,
    UpdateView,
    DeleteView
)
from .models import Post
User = get_user_model()

def register(request):
    return render(request, 'accounts/register.html')

class customer_register(CreateView):
    model = User
    form_class = CustomerSignUpForm
    template_name = 'accounts/customer_register.html'

    def form_valid(self, form):
        user = form.save()
        login(self.request, user)
        return redirect('login')

class employee_register(CreateView):
    model = User
    form_class = EmployeeSignUpForm
    template_name = 'accounts/employee_register.html'

    def form_valid(self, form):
        user = form.save()
        login(self.request, user)
        return redirect('login')


def login_request(request):
    if request.method=='POST':
        form = AuthenticationForm(data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)
            if user is not None :
                login(request,user)
                return redirect('home')
            else:
                messages.error(request,"Invalid username or password")
        else:
                messages.error(request,"Invalid username or password")
    return render(request, 'accounts/login.html',
    context={'form':AuthenticationForm()})

def logout_view(request):
    logout(request)
    return redirect('/')




def profile(request):


    return render(request, 'accounts/profile.html')


def userprofile(request, id):
    allrequest = Friend_Request.objects.all()
    user1 = User.objects.get(id = id)
    context= {
        'user1': user1
        }

    return render(request, 'accounts/userprofile.html', context)







class customer_update(CreateView):
    model = User
    form_class = CustomerEditForm
    template_name = 'accounts/edit_profile.html'

    def form_valid(self, form):
        user = form.save()
        login(self.request, user)
        return redirect('home')

    def get_object(self) :
        return self.request.user



def BidRequest(request):
    allrequest = Friend_Request.objects.all()
    context= {
        'allrequest': allrequest
        }
    return render(request, 'accounts/bid_request.html', context)




def home(request):
    context = {
        'posts': Post.objects.all(),
        'all_accept':Friend.objects.all()
        }

    return render(request, 'accounts/home.html', context)


class PostListView(ListView):
    model = Post
    template_name = 'accounts/home.html'  # <app>/<model>_<viewtype>.html
    context_object_name = 'posts'
    all_accept=Friend.objects.all()
    ordering = ['-date_posted']


def MyPost(request):
  # <app>/<model>_<viewtype>.html
    context = {
        'posts': Post.objects.all()
    }
    ordering = ['-date_posted']
    return render(request, 'accounts/mypost.html', context)


class PostDetailView(DetailView):
    model = Post





class PostCreateView(LoginRequiredMixin, CreateView):
    model = Post
    fields = ['title','job_field','problem_content']

    def form_valid(self, form):
        form.instance.author = self.request.user
        return super().form_valid(form)


class PostUpdateView(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    model = Post
    fields = ['title','job_field','problem_content']

    def form_valid(self, form):
        form.instance.author = self.request.user
        return super().form_valid(form)

    def test_func(self):
        post = self.get_object()
        if self.request.user == post.author:
            return True
        return False


class PostDeleteView(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    model = Post
    success_url = '/'

    def test_func(self):
        post = self.get_object()
        if self.request.user == post.author:
            return True
        return False




def send_friend_request(request, id, postID):
    from_user = request.user
    to_user = User.objects.get(id = id)
    post_Id = Post.objects.get(id = postID)
    friend_request, created = Friend_Request.objects.get_or_create(from_user=from_user,post_Id=post_Id,to_user=to_user)
    return redirect('home')



def accept_friend_request(request, a_id, post_a):
    from_user_a = request.user
    to_user_a = User.objects.get(id = a_id)
    post_Id_a = Post.objects.get(id = post_a)
    friend, created = Friend.objects.get_or_create(from_user_a=from_user_a,post_Id_a=post_Id_a,to_user_a=to_user_a)
    return redirect('profile')



def accept_request(request):
    all_accept = Friend.objects.all()
    context= {
        'all_accept': all_accept
        }
    return render(request, 'accounts/accepted.html', context)



def order_history(request):
    all_accept = Friend.objects.all()
    context= {
        'all_accept': all_accept
        }
    return render(request, 'accounts/orderhistory.html', context)



def notification(request):

    context = {
        'posts': Post.objects.all()
        }
    class Meta:
        ordering = ['-date_posted']
    return render(request, 'accounts/post_notification.html', context)



def jobField(request):
    context = {
        'posts': Post.objects.all()
        }
    return render(request, 'accounts/field.html', context)



def jobField2(request):
    context = {
        'posts': Post.objects.all()
        }
    return render(request, 'accounts/field2.html', context)



def jobField3(request):
    context = {
        'posts': Post.objects.all()
        }
    return render(request, 'accounts/field3.html', context)



def date_posted(request):
    context = {
        'posts': Post.objects.all(),

        }

    return render(request, 'accounts/date.html', context)




def like(request, post_Id_r, from_id, lik):
    post_Id_r = Post.objects.get(id = post_Id_r)
    like = request.user
    to_user_r = User.objects.get(id = from_id)
    rating = lik
    likes, created = Review.objects.get_or_create(rating=rating,like=like,post_Id_r=post_Id_r,to_user_r=to_user_r)
    return redirect('home')


def review(request, id):
    user2 = User.objects.get(id = id)
    context = {
        'reviews': Review.objects.all(),
        'user2': user2

        }

    return render(request, 'accounts/review.html', context)



def about(request):

    return render(request, 'accounts/about.html')


def contact(request):

    return render(request, 'accounts/contact.html')
