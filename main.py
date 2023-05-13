from fastapi import FastAPI
from conexion_api.Accion  import Accion
import json 

app= FastAPI()

@app.get("/")
def home():
    return { "name" : "hola"}


@app.get("/accion/{nombre_accion}")
async def accion(nombre_accion: str):
  concatenar = nombre_accion +".mx"
  print(concatenar)
  ac1=Accion()
  return  ac1.PrecioAccion(concatenar) 
  
  
  
  