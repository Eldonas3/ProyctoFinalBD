from django.shortcuts import render,redirect
from .models import Perfiles,Empleado,Mascota,Cliente,Raza,Especie,Adopcion,Cuidado
from .forms import *

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
    formularios = ClienteForm(request.POST or None)
    if formularios.is_valid():
        formularios.save()
        return redirect('/Home/Read/read_cliente')
    return render(request,'create/create_cliente.html',{'perfiles':perfiles,'formularios':formularios})

def create_empleado(request):
    perfiles = Perfiles.objects.all()
    formularios = EmpleadoForm(request.POST or None)
    if formularios.is_valid():
        formularios.save()
        return redirect('/Home/Read/read_empleado')    
    return render(request,'create/create_empleado.html',{'perfiles':perfiles,'formularios':formularios})

def create_mascota(request):
    razas = Raza.objects.all()
    formularios = MascotaForm(request.POST or None)
    if formularios.is_valid():
        formularios.save()
        return redirect('/Home/Read/read_mascota')    
    return render(request,'create/create_mascota.html',{'razas':razas,'formularios':formularios})

def create_perfiles(request):
    formularios = PerfilesForm(request.POST or None)
    if formularios.is_valid():
        formularios.save()
        return redirect('/Home/Read/read_perfiles')
    return render(request,'create/create_perfiles.html',{'formularios':formularios})

def create_cuidado(request):
    razas = Raza.objects.all()
    formularios = CuidadoForm(request.POST or None)
    if formularios.is_valid():
        formularios.save()
        return redirect('/Home/Read/read_cuidado')    
    return render(request,'create/create_cuidado.html',{'razas':razas,'formularios':formularios})

def create_especie(request):
    formularios = EspecieForm(request.POST or None)
    if formularios.is_valid():
        formularios.save()
        return redirect('/Home/Read/read_especie')    
    return render(request,'create/create_especie.html',{'formularios':formularios})

def create_raza(request):
    especies = Especie.objects.all()
    formularios = RazaForm(request.POST or None)
    if formularios.is_valid():
        formularios.save()
        return redirect('/Home/Read/read_raza')    
    return render(request,'create/create_raza.html',{'especies':especies,'formularios':formularios})

def create_adopcion(request):
    clientes = Cliente.objects.all()
    empleados = Empleado.objects.all()
    mascotas = Mascota.objects.all()
    formularios = AdopcionForm(request.POST or None)
    if formularios.is_valid():
        formularios.save()
        return redirect('/Home/Read/read_adopcion')
    return render(request,'create/create_adopcion.html',{'clientes':clientes,'empleados':empleados,'mascotas':mascotas,'formularios':formularios})

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

def delete_adopcion(request):
    adopciones = Adopcion.objects.all()
    return render(request,'delete/delete_adopcion.html',{'adopciones':adopciones})

def delete_data_adopcion(request,id_adopcion):
    adopcion = Adopcion.objects.get(id_adopcion=id_adopcion)
    adopcion.delete()
    return redirect('/Home/Read/read_adopcion')

def delete_cliente(request):
    clientes = Cliente.objects.all()
    return render(request,'delete/delete_cliente.html',{'clientes':clientes})

def delete_data_cliente(request,id_cliente):
    cliente = Cliente.objects.get(id_cliente=id_cliente)
    cliente.delete()
    return redirect('/Home/Read/read_cliente')

def delete_cuidado(request):
    cuidados = Cuidado.objects.all()
    return render(request,'delete/delete_cuidado.html',{'cuidados':cuidados})

def delete_data_cuidado(request,id_cuidado):
    cuidado = Cuidado.objects.get(id_cuidado=id_cuidado)
    cuidado.delete()
    return redirect('/Home/Read/read_cuidado')

def delete_empleado(request):
    empleados = Empleado.objects.all()
    return render(request,'delete/delete_empleado.html',{'empleados':empleados})

def delete_data_empleado(request,id_empleado):
    empleado = Empleado.objects.get(id_empleado=id_empleado)
    empleado.delete()
    return redirect('/Home/Read/read_empleado')

def delete_especie(request):
    especies = Especie.objects.all()
    return render(request,'delete/delete_especie.html',{'especies':especies})

def delete_data_especie(request,id_especie):
    especie = Especie.objects.get(id_especie=id_especie)
    especie.delete()
    return render('/Home/Read/read_especie')

def delete_mascota(request):
    mascotas = Mascota.objects.all()
    return render(request,'delete/delete_mascota.html',{'mascotas':mascotas})

def delete_data_mascota(request,id_mascota):
    mascota = Mascota.objects.get(id_mascota=id_mascota)
    mascota.delete()
    return redirect('/Home/Read/read_mascota')

def delete_perfiles(request):
    perfiles = Perfiles.objects.all()
    return render(request,'delete/delete_perfiles.html',{'perfiles':perfiles})

def delete_data_perfiles(request,id_perfil):
    perfil = Perfiles.objects.get(id_perfil=id_perfil)
    perfil.delete()
    return redirect('/Home/Read/read_perfiles')

def delete_raza(request):
    razas = Raza.objects.all()
    return render(request,'delete/delete_raza.html',{'razas':razas})

def delete_data_raza(request,id_raza):
    raza = Raza.objects.get(id_raza = id_raza)
    raza.delete()
    return redirect('/Home/Read/read_mascota')

def update_adopcion(request):
    adopciones = Adopcion.objects.all()
    return render(request,'update/update_adopcion.html',{'adopciones':adopciones})

def update_data_adopcion(request,id_adopcion):
    adopcion = Adopcion.objects.get(id_adopcion=id_adopcion)
    formulario = AdopcionForm(request.POST or None,instance=adopcion)
    if formulario.is_valid() and request.POST:
        formulario.save()
        return redirect('/Home/Read/read_adopcion')
    return render(request,'update/update.html',{'formulario':formulario})

def update_cliente(request):
    clientes = Cliente.objects.all()
    return render(request,'update/update_cliente.html',{'clientes':clientes})

def update_data_cliente(request,id_cliente):
    cliente = Cliente.objects.get(id_cliente=id_cliente)
    formulario =  ClienteForm(request.POST or None,instance=cliente)
    if formulario.is_valid() and request.POST:
        formulario.save()
        return redirect('/Home/Read/read_cliente')
    return render(request,'update/update.html',{'formulario':formulario})

def update_cuidado(request):
    cuidados = Cuidado.objects.all()
    return render(request,'update/update_cuidado.html',{'cuidados':cuidados})

def update_data_cuidado(request,id_cuidado):
    cuidado = Cuidado.objects.get(id_cuidado=id_cuidado)
    formulario = CuidadoForm(request.POST or None,instance=cuidado)
    if formulario.is_valid() and request.POST:
        formulario.save()
        return redirect('/Home/Read/read_cuidado')
    return render(request,'update/update.html',{'formulario':formulario})    

def update_empleado(request):
    empleados = Empleado.objects.all()
    return render(request,'update/update_empleado.html',{'empleados':empleados})

def update_data_empleado(request,id_empleado):
    empleado = Empleado.objects.get(id_empleado=id_empleado)
    formulario = EmpleadoForm(request.POST or None,instance=empleado)
    if formulario.is_valid() and request.POST:
        formulario.save()
        return redirect('/Home/Read/read_empleado') 
    return render(request,'update/update.html',{'formulario':formulario})     

def update_especie(request):
    especies = Especie.objects.all()
    return render(request,'update/update_especie.html',{'especies':especies})

def update_data_especie(request,id_especie):
    especie = Especie.objects.get(id_especie=id_especie)
    formulario = EspecieForm(request.POST or None,instance=especie)
    if formulario.is_valid() and request.POST:
        formulario.save()
        return redirect('/Home/Read/read_especie') 
    return render(request,'update/update.html',{'formulario':formulario})    

def update_mascota(request):
    mascotas = Mascota.objects.all()
    return render(request,'update/update_mascota.html',{'mascotas':mascotas})

def update_data_mascota(request,id_mascota):
    mascota = Mascota.objects.get(id_mascota=id_mascota)
    formulario = MascotaForm(request.POST or None,instance=mascota)
    if formulario.is_valid() and request.POST:
        formulario.save()
        return redirect('/Home/Read/read_mascota') 
    return render(request,'update/update.html',{'formulario':formulario})

def update_perfiles(request):
    perfiles = Perfiles.objects.all()
    return render(request,'update/update_perfiles.html',{'perfiles':perfiles})

def update_data_perfiles(request,id_perfil):
    perfil = Perfiles.objects.get(id_perfil=id_perfil)
    formulario = PerfilesForm(request.POST or None,instance=perfil)
    if formulario.is_valid() and request.POST:
        formulario.save()
        return redirect('/Home/Read/read_perfiles') 
    return render(request,'update/update.html',{'formulario':formulario})

def update_raza(request):
    razas = Raza.objects.all()
    return render(request,'update/update_raza.html',{'razas':razas})

def update_data_raza(request,id_raza):
    raza = Raza.objects.get(id_raza=id_raza)
    formulario = RazaForm(request.POST or None,instance=raza)
    if formulario.is_valid() and request.POST:
        formulario.save()
        return redirect('/Home/Read/read_raza') 
    return render(request,'update/update.html',{'formulario':formulario})