import datetime
from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.db import connection
from .models import *
from .forms import *
from django.core.management import call_command
# import os

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

def miscellaneous(request):
    return render(request,'miscellaneous/miscellaneous.html')

def consults(request):
    return render(request,'consults/consults.html')

def view_access_credentials(request):
    with connection.cursor() as cursor:
        # Ejecutar una consulta SQL direct
        cursor.execute("SELECT * FROM access_credential")
        # Obtener los resultados
        credentials = cursor.fetchall()
        # la razón de que no imprima los datos es por que es una tupla
        # debo acceder a ella como una tupla
        # for credential in credentials:
        #     print(credential[0])
    return render(request,'views_db/access_credential.html',{'credentials':credentials})

def view_adoptions_in_process(request):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM adoptions_in_process")
        credentials = cursor.fetchall()
    return render(request,'views_db/adoptions_in_process.html',{'credentials':credentials})
    
def view_adoption_acepted(request):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM adoption_acepted")
        credentials = cursor.fetchall()
    return render(request,'views_db/adoption_acepted.html',{'credentials':credentials})

def view_real_name(request):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM real_name")
        credentials = cursor.fetchall()
    return render(request,'views_db/real_name.html',{'credentials':credentials})

def view_cliente_contact(request):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM cliente_contact")
        credentials = cursor.fetchall()
    return render(request,'views_db/cliente_contact.html',{'credentials':credentials})

def consult_one(request):
    #access_credential
    credentials = Empleado.objects.select_related('perfil__cliente').values(
    'nombre_usuario',
    'contrasena',
    'correo_electronico',
    'perfil__cliente__nombre_usuario',
    'perfil__cliente__contrasena',
    'perfil__cliente__correo_electronico')
    return render(request,'consults/consult_one.html',{'credentials':credentials})

def consult_two(request):
    #adoptions_in_process
    credentials = Adopcion.objects.filter(status_adopcion=0).values(
    'id_adopcion',
    'empleado__nombre_empleado')
    return render(request,'consults/consult_two.html',{'credentials':credentials})

def consult_three(request):
    #adoption_acepted
    credentials = Adopcion.objects.filter(status_adopcion=1).values(
    'id_adopcion',
    'empleado__nombre_empleado',
    'cliente__nombre_cliente',
    'mascota__nombre')
    return render(request,'consults/consult_three.html',{'credentials':credentials})

def consult_four(request):
    #real_name
    credentials = Adopcion.objects.select_related('cliente').values(
    'id_adopcion',
    'cliente__nombre_cliente',
    'cliente__apellido_materno',
    'cliente__apellido_paterno')
    return render(request,'consults/consult_four.html',{'credentials':credentials})

def consult_five(request):
    #cliente_contact
    credentials = Adopcion.objects.filter(status_adopcion=0).select_related('cliente').values(
    'cliente__nombre_cliente',
    'cliente__telefono',
    'cliente__correo_electronico',
    'status_adopcion')
    return render(request,'consults/consult_five.html',{'credentials':credentials})

def descargar_respaldo(request):
    # Ruta al archivo que deseas descargar (ajusta esto según tu caso)
    current_datetime = datetime.datetime.now()
    timestamp = current_datetime.strftime('%Y-%m-%d_%H-%M-%S')

    filename = f'backups/db_{timestamp}.json'

    call_command('dumpdata', output=filename, format='json',indent=2)

    with open(filename, 'rb') as file:
        response = HttpResponse(file.read(), content_type='application/json')
        response['Content-Disposition'] = f'attachment; filename="backups/db_{timestamp}.json"'
    return response