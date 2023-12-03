from django.shortcuts import render
from django.http import HttpResponse,JsonResponse

# Create your views here.
def hello(request):
    return HttpResponse("Hola mundo")
def about(request):
    return HttpResponse("About")

def perfiles(request):
    p = list(perfiles.object.values())
    return JsonResponse(p, safe=False)

def index(request):
    #Esto es un ejemplo de como puedes usar datos en un html
    #Puedes procesar datos de la BD y luego enviarlos
    titulo = 'APP WEB CON PYTHON!!!'
    return render(request,'index.html',{
        'titulo':titulo
    })