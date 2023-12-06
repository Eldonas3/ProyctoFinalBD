from django.shortcuts import render
from .models import Perfiles,Empleado,Mascota,Cliente,Raza,Especie,Adopcion,Cuidado
from .forms import ClienteForm

# Create your views here.
def home(request):
    return render(request,'home.html')

def create(request):
    return render(request,'crud/create.html')

def read(request):
    return render(request,'crud/read.html')

def update(request):
    return render(request,'crud/update.html')

def delete(request):
    return render(request,'crud/delete.html')

def create_cliente(request):
    perfiles = Perfiles.objects.all()
    # context ={}
    formularios = ClienteForm(request.POST or None)
    # if form.is_valid():
    #     form.save()
    # context['form'] = form
    return render(request,'create/create_cliente.html',{'perfiles':perfiles,'formularios':formularios})

def create_empleado(request):
    perfiles = Perfiles.objects.all()
    return render(request,'create/create_empleado.html',{'perfiles':perfiles})

def create_mascota(request):
    razas = Raza.objects.all()
    return render(request,'create/create_mascota.html',{'razas':razas})

def create_perfiles(request):
    return render(request,'create/create_perfiles.html')

def create_cuidado(request):
    razas = Raza.objects.all()
    return render(request,'create/create_cuidado.html',{'razas':razas})

def create_especie(request):
    return render(request,'create/create_especie.html')

def create_raza(request):
    especies = Especie.objects.all()
    return render(request,'create/create_raza.html',{'especies':especies})

def create_adopcion(request):
    clientes = Cliente.objects.all()
    empleados = Empleado.objects.all()
    mascotas = Mascota.objects.all()
    return render(request,'create/create_adopcion.html',{'clientes':clientes,'empleados':empleados,'mascotas':mascotas})

def read_adopcion(request):
    adopciones = Adopcion.objects.all()
    return render(request,'read/read_adopcion.html',{'adopciones':adopciones})

def read_cliente(request):
    clientes = Cliente.objects.all()
    return render(request,'read/read_cliente.html',{'clientes':clientes})

def read_cuidado(request):
    cuidados = Cuidado.objects.all()
    return render(request,'read/read_cuidado.html',{'cuidados':cuidados})

def read_empleado(request):
    empleados = Empleado.objects.all()
    return render(request,'read/read_empleado.html',{'empleados':empleados})

def read_especie(request):
    especies = Especie.objects.all()
    return render(request,'read/read_especie.html',{'especies':especies})

def read_mascota(request):
    mascotas = Mascota.objects.all()
    return render(request,'read/read_mascota.html',{'mascotas':mascotas})

def read_perfiles(request):
    perfiles = Perfiles.objects.all()
    return render(request,'read/read_perfiles.html',{'perfiles':perfiles})

def read_raza(request):
    razas = Raza.objects.all()
    return render(request,'read/read_raza.html',{'razas':razas})