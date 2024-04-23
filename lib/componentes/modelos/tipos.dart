import 'package:flutter/material.dart';
import 'package:flutter_application_1/componentes/modelos/plantas.dart';

//LIBRERIA O INVENTARIO CON LOS DATOS DE CADA PLANTA, QUE SE USARÁ PARA CREAR LAS TARJETAS

class Tipos extends ChangeNotifier{
  //lista de opciones de plantas visibles
  List<Plantas> inventario = [
    Plantas(
      name: "Huerto",
      cuidado: "Es de suma importancia el cuidado de los huertos, pues si no se les da mantenimiento pueden afectar el desarrollo de la planta, así que asegurese de limpiarlo, de vez en cuando filtrar el agua, etc.", 
      imagen:'lib/Imgs/huertos.jpg', 
      descripcion: "Ir a pagina web para ver"
      
    ),
    Plantas(
      name: "Fresa",
      cuidado: "Se recomienda planta al final de la primavera, requieren de luz solar (no exesiva), consume nutrientes y no requiere de tanta humedad. Al plantarlas regar diariamente, después de un tiempo, regar de 1-2 veces por semana, con 1.8 L cada riego.", 
      imagen:'lib/Imgs/fresas.jpg', 
      descripcion: "Son delicadas"
    ),
    Plantas(
      name: "Lechuga",
      cuidado: "Requiren de una humedad alta (no excesiva), necesitan de luz natural (de 4-5 horas),", 
      imagen:'lib/Imgs/lechuga.jpg', 
      descripcion: "Regar cada 3 días con 3 L."
    ),
    Plantas(
      name: "Limón",
      cuidado: "Necesitan de mucha luz solar, humadedad ente 18-29°C, nutrir de vez en cuando. ", 
      imagen:'lib/Imgs/limon.jpg', 
      descripcion: "Regar cada 3 días 1.5 L"
    ),
    Plantas(
      name: "Tomate",
      cuidado: "Necesitan de bastante luz, pero sobre todo una humedad entre 20-28°C ya que así creceran más jugosos y rojos. ", 
      imagen:'lib/Imgs/tomate.jpg', 
      descripcion: "Regar cada 2 días 3L"
    ),
    Plantas(
      name: "Nopal",
      cuidado: "No requieren de tanto cuidado pués son muy resistentes, puedes tenerlos en tu oficina.", 
      imagen:'lib/Imgs/nopal.jpg', 
      descripcion: "Regar cada 4 días."
    ),
    Plantas(
      name: "Naranja",
      cuidado: "Necesitan de mucha luz solar, humadedad ente 18-29°C, nutrir de vez en cuando. ", 
      imagen:'lib/Imgs/naranja.jpg', 
      descripcion: "Regar cada 3 días 1.5 L"
    ),
    Plantas(
      name: "Pimiento Morrón",
      cuidado: "Crecen muy rápido y no requieren de tanto sol, darles cierta cantidad de nutrientes para que no se marchiten.", 
      imagen:'lib/Imgs/pimiento.jpg', 
      descripcion: "Regar cada 2 días 2.5 L"
    ),
  ];

  // lista de la opcion seleccionada
  //userCart
  List<Plantas> seleccionUsuario = [];
  //obtener especificaciones
  //getShoeList
  List<Plantas> obtenerinventario(){
    return inventario;
  }
  //getUserCart
  List<Plantas> obtenerPlanta(){
    return seleccionUsuario;
  }
  //Abrir lo seleccionado 
  //addItemtocart
  void addPlanta(Plantas plantas){
    if(!seleccionUsuario.contains(plantas)){
      seleccionUsuario.add(plantas);
      notifyListeners();
    }
  }
  // quitar planta previa seleccionada
  //removeItemfromCart
    void removePlanta(Plantas plantas){
      if(seleccionUsuario.contains(plantas)){
        seleccionUsuario.remove(plantas);
        notifyListeners();
      }
  }

}