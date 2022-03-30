from django.contrib.auth.forms import UserCreationForm,UserChangeForm
from django import forms
from django.db import transaction
from accounts.models import User,Customer,Employee

from django.utils.translation import ugettext_lazy as _



STATES = (
    ('', 'Choose...'),
    ('AC mechanics', 'AC mechanics'),
    ('electrician', 'electrician'),
    ('Tv mechanics', 'Tv mechanics')
)


class CustomerSignUpForm(UserCreationForm):
    first_name = forms.CharField(required=True)
    last_name = forms.CharField(required=True)

    phone_number = forms.CharField(required=True)
    location = forms.CharField(required=True)
    house = forms.CharField(max_length=20)
    flat = forms.CharField(max_length=20)

    class Meta(UserCreationForm.Meta):
        model = User

    @transaction.atomic
    def save(self):
        user = super().save(commit=False)
        user.is_customer = True
        user.is_staff = True
        user.first_name = self.cleaned_data.get('first_name')
        user.last_name = self.cleaned_data.get('last_name')
        user.save()
        customer = Customer.objects.create(user=user)
        customer.phone_number=self.cleaned_data.get('phone_number')
        customer.location=self.cleaned_data.get('location')
        customer.house=self.cleaned_data.get('house')
        customer.flat=self.cleaned_data.get('flat')
        customer.save()
        return user



class EmployeeSignUpForm(UserCreationForm):
    first_name = forms.CharField(required=True)
    last_name = forms.CharField(required=True)

    phone_number = forms.CharField(required=True)
    nid = forms.CharField(max_length=20)
    workplace = forms.CharField(max_length=20)
    job_field = forms.ChoiceField(choices=STATES)

    class Meta(UserCreationForm.Meta):
        model = User

    @transaction.atomic
    def save(self):
        user = super().save(commit=False)
        user.is_employee = True
        user.is_staff = True
        user.first_name = self.cleaned_data.get('first_name')
        user.last_name = self.cleaned_data.get('last_name')
        user.save()
        employee = Employee.objects.create(user=user)
        employee.phone_number=self.cleaned_data.get('phone_number')
        employee.nid = self.cleaned_data.get('nid')
        employee.workplace =self.cleaned_data.get('workplace')
        employee.job_field =self.cleaned_data.get('job_field')

        employee.save()
        return user







class CustomerEditForm(UserChangeForm):
    first_name = forms.CharField(required=True)
    last_name = forms.CharField(required=True)
    phone_number = forms.CharField(required=True)
    location = forms.CharField(required=True)

    class Meta:
        model = User
        fields =('username','first_name','last_name','phone_number','location' )



    @transaction.atomic
    def save(self):
        user = super().save(commit=False)
        user.is_customer = True
        user.first_name = self.cleaned_data.get('first_name')
        user.last_name = self.cleaned_data.get('last_name')
        user.save()
        customer = Customer.objects.create(user=user)
        customer.phone_number=self.cleaned_data.get('phone_number')
        customer.location=self.cleaned_data.get('location')
        customer.save()
        return user
