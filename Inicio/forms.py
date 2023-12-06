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
        "foto",
        "perfil",
        "nombre_usuario",
        "contrasena",
        ]