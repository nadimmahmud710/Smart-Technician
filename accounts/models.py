from django.db import models
from django.contrib.auth.models import AbstractUser,User
from django.urls import reverse
from django.utils import timezone
from django.utils.timezone import localtime, now
from django.db.models.signals import post_save
from django.conf import settings
from autoslug import AutoSlugField




STATES = (
    ('', 'Choose...'),
    ('AC mechanics', 'AC mechanics'),
    ('electrician', 'electrician'),
    ('Tv mechanics', 'Tv mechanics')
)






# Create your models here.




class User(AbstractUser):
    is_customer = models.BooleanField(default=False)
    is_employee = models.BooleanField(default=False)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)




class Customer(models.Model):
    user = models.OneToOneField(User, on_delete = models.CASCADE, primary_key = True)

    phone_number = models.CharField(max_length=20)
    location = models.CharField(max_length=20)
    house = models.CharField(max_length=20)
    flat = models.CharField(max_length=20)

class Employee(models.Model):
    user = models.OneToOneField(User, on_delete = models.CASCADE, primary_key = True)

    phone_number = models.CharField(max_length=20)
    nid = models.CharField(max_length=20)
    workplace = models.CharField(max_length=20)
    job_field = models.CharField(max_length=20)






class Post(models.Model):
    title = models.CharField(max_length=100)
    job_field = models.CharField(choices=STATES, max_length=100)
    problem_content = models.TextField()
    date_posted = models.DateTimeField(default=timezone.now)
    author = models.ForeignKey(User, on_delete=models.CASCADE)

    class Meta:
        ordering = ['-date_posted']


    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('post-detail', kwargs={'pk': self.pk})

class Friend_Request(models.Model):
    post_Id = models.ForeignKey(Post, on_delete=models.CASCADE, related_name="postID")
    from_user = models.ForeignKey(User, related_name='from_user', on_delete=models.CASCADE)
    to_user = models.ForeignKey(User, related_name='to_user', on_delete=models.CASCADE)
    date_posted = models.DateTimeField(default=timezone.now)
    class Meta:
        ordering = ['-date_posted']

class Friend(models.Model):
    post_Id_a = models.ForeignKey(Post, on_delete=models.CASCADE, related_name="postID_a")
    from_user_a = models.ForeignKey(User, related_name='from_user_a', on_delete=models.CASCADE)
    to_user_a = models.ForeignKey(User, related_name='to_user_a', on_delete=models.CASCADE)
    date_posted = models.DateTimeField(default=timezone.now)
    class Meta:
        ordering = ['-date_posted']



class Review(models.Model):
    post_Id_r = models.ForeignKey(Post, on_delete=models.CASCADE, related_name="postID_r")
    like = models.ForeignKey(User, related_name='like', on_delete=models.CASCADE)
    to_user_r = models.ForeignKey(User, related_name='to_user_r', on_delete=models.CASCADE)
    rating = models.IntegerField(max_length=20)
    date_posted = models.DateTimeField(default=timezone.now)

    class Meta:
        ordering = ['-date_posted']
