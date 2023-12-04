from django.urls import path
from . import views

urlpatterns = [
    path('',views.home),
    path('Create/',views.create),
    path('Read/',views.read),
    path('Update/',views.update),
    path('Delete/',views.delete),
    path('Create/create_cliente',views.create_cliente),
    path('Create/create_empleado',views.create_empleado),
    path('Create/create_mascota',views.create_mascota),
    path('Create/create_perfiles',views.create_perfiles),
    path('Create/create_cuidado',views.create_cuidado),
    path('Create/create_especie',views.create_especie),
    path('Create/create_raza',views.create_raza),
    path('Create/create_adopcion',views.create_adopcion),
    path('Read/read_adopcion',views.read_adopcion),
    path('Read/read_cliente',views.read_cliente),
    path('Read/read_cuidado',views.read_cuidado),
    path('Read/read_empleado',views.read_empleado),
    path('Read/read_especie',views.read_especie),
    path('Read/read_mascota',views.read_mascota),
    path('Read/read_perfiles',views.read_raza),
]