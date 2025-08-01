from django.shortcuts import render, redirect
from .forms import StudentForm

def register(request):
    form = StudentForm(request.POST or None)
    if form.is_valid():
        form.save()
        return redirect('success')
    return render(request, 'register.html', {'form': form})

def success(request):
    return render(request, 'success.html')
