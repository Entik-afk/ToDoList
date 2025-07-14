from django.shortcuts import render, redirect
from .models import Task
from .forms import TaskForm



# Create your views here.

def task_list(request):
    tasks = Task.objects.all().order_by('-created')
    form = TaskForm()

    if request.method == 'POST':
        form = TaskForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('task_list')

    return render(request, 'tasks/task_list.html', {'tasks': tasks, 'form': form})