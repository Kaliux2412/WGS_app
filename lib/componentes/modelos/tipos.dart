import 'package:flutter/material.dart';
import 'package:flutter_application_1/componentes/modelos/plantas.dart';

class Tipos extends ChangeNotifier{
  //lista de opciones de plantas visibles
  List<Plantas> inventario = [
    Plantas(
      name: "Huerto",
      cuidado: "Ver más a detalle el cuidado del Huerto", 
      imagen:'lib/Imgs/huertos.jpg', 
      descripcion: "Especificaciones del huerto"
      
    ),
    Plantas(
      name: "Fresa",
      cuidado: "Regar cada 2 días y no echar tanta agua", 
      imagen:'lib/Imgs/fresas.jpg', 
      descripcion: "Son delicadas"
    ),
    Plantas(
      name: "Lechuga",
      cuidado: "Tardan en crecer pero no requieren de tanta agua", 
      imagen:'lib/Imgs/lechuga.jpg', 
      descripcion: "Requieren más de espacio"
    ),
    Plantas(
      name: "Limón",
      cuidado: "Regar cada 2 días con abundante agua y ponerle amor y dedicación ya que son sensibles", 
      imagen:'lib/Imgs/limon.jpg', 
      descripcion: "Requieren de más tierra"
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