from django import forms
from .models import *

#Creamos un form
class ClienteForm(forms.ModelForm):
    #Creamos clase meta
    class Meta:
        # Especificamos el modelo a utilizar
        model = Cliente
        #Especificamos los campos a ser usados
        fields = [
        "nombre_cliente",
        "apellido_materno",
        "apellido_paterno",
        "telefono",
        "direccion",
        "correo_electronico",
        "edad",
        "sexo",
        "perfil",
        "nombre_usuario",
        "contrasena",
        ]

class AdopcionForm(forms.ModelForm):
    class Meta:
        model = Adopcion
        fields = [
            "cliente",
            "empleado",
            "mascota",
            "fecha_adopcion",
            "status_adopcion",
        ]

class EmpleadoForm(forms.ModelForm):
    class Meta:
        model = Empleado
        fields = [
            "nombre_empleado",
            "apellido_materno",
            "apellido_paterno",
            "telefono",
            "direccion",
            "correo_electronico",
            "rfc",
            "cuenta_bancaria",
            "edad",
            "sexo",
            "perfil",
            "nombre_usuario",
            "contrasena",
            "status"
        ]

class CuidadoForm(forms.ModelForm):
    class Meta:
        model = Cuidado
        fields = [
            "dieta",
            "raza", 
            "cuidados",
        ]

class EspecieForm(forms.ModelForm):
    class Meta:
        model = Especie
        fields = [
            "nombre_especie",
        ]

class MascotaForm(forms.ModelForm):
    class Meta:
        model = Mascota
        fields = [
            "nombre",
            "peso",
            "edad",
            "sexo",
            "descripcion",
            "raza",
        ]

class PerfilesForm(forms.ModelForm):
    class Meta:
        model = Perfiles
        fields = [
            "perfil",
            "descripcion",
            "status"
        ]

class RazaForm(forms.ModelForm):
    class Meta:
        model = Raza
        fields = [
          "especie",
          "nombre_raza",  
        ]