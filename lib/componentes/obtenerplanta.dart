// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/componentes/modelos/plantas.dart';

// import 'modelos/tipos.dart';

// import 'package:flutter/material.dart';


// class Plantas {

//   final String name;

//   final String cuidado;

//   final String imagen;

//   final String descripcion;


//   Plantas({required this.name, required this.cuidado, required this.imagen, required this.descripcion});


//   @override

//   bool operator ==(Object other) {

//     if (identical(this, other)) return true;


//     return other is Plantas &&

//       other.name == name &&

//       other.cuidado == cuidado &&

//       other.imagen == imagen &&

//       other.descripcion == descripcion;

//   }


//   @override

//   int get hashCode {

//     return name.hashCode ^

//            cuidado.hashCode ^

//            imagen.hashCode ^

//            descripcion.hashCode;

//   }

// }


// class Tipos extends ChangeNotifier {

//   //lista de opciones de plantas visibles

//   List<Plantas> inventario = [

//     Plantas(

//       name: "Huerto",

//       cuidado: "Ver más a detalle el cuidado del Huerto", 

//       imagen:'lib/Imgs/huertos.jpg', 

//       descripcion: "Especificaciones del huerto"

      

//     ),

//     Plantas(

//       name: "Fresa",

//       cuidado: "Regar cada 2 días y no echar tanta agua", 

//       imagen:'lib/Imgs/fresas.jpg', 

//       descripcion: "Son delicadas"

//     ),

//     Plantas(

//       name: "Lechuga",

//       cuidado: "Tardan en crecer pero no requieren de tanta agua", 

//       imagen:'lib/Imgs/lechuga.jpg', 

//       descripcion: "Requieren más de espacio"

//     ),

//     Plantas(

//       name: "Limón",

//       cuidado: "Regar cada 2 días con abundante agua y ponerle amor y dedicación ya que son sensibles", 

//       imagen:'lib/Imgs/limon.jpg', 

//       descripcion: "Requieren de más tierra"

//     ),

//   ];


//   // lista de la opcion seleccionada

//   //userCart

//   List<Plantas> seleccionUsuario = [];


//   void addPlanta(Plantas plantas){

//     if(!seleccionUsuario.contains(plantas)){

//       seleccionUsuario.add(plantas);

//       notifyListeners();

//     }

//   }


//   void removePlanta(Plantas plantas){

//     if(seleccionUsuario.contains(plantas)){

//       seleccionUsuario.remove(plantas);

//       notifyListeners();

//     }

//   }


//   List<Plantas> obtenerinventario() {

//     return inventario;

//   }


//   List<Plantas> obtenerPlanta() {

//     return seleccionUsuario;

//   }

// }

// class InventoryScreen extends StatefulWidget {
//   @override
//   _InventoryScreenState createState() => _InventoryScreenState();
// }

// class _InventoryScreenState extends State<InventoryScreen> {
//   final Tipos tipos = Tipos();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Inventory'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: tipos.obtenerinventario().length,
//               itemBuilder: (context, index) {
//                 final Plantas planta = tipos.obtenerinventario()[index];
//                 return GestureDetector(
//                   onTap: () {
//                     if (tipos.seleccionUsuario.contains(planta)) {
//                       tipos.removePlanta(planta);
//                     } else {
//                       tipos.addPlanta(planta);
//                     }
//                     setState(() {});
//                   },
//                   child: Container(
//                     margin: EdgeInsets.all(8),
//                     padding: EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Row(
//                       children: [
//                         Image.asset(planta.imagen, width: 80),
//                         SizedBox(width: 16),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(planta.name, style: TextStyle(fontWeight: FontWeight.bold)),
//                             Text(planta.cuidado),
//                           ],
//                         ),
//                         Spacer(),
//                         if (tipos.seleccionUsuario.contains(planta))
//                           IconButton(
//                             icon: Icon(Icons.check),
//                             onPressed: () {
//                               tipos.removePlanta(planta);
//                               setState(() {});
//                             },
//                           ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: tipos.obtenerPlanta().length,
//               itemBuilder: (context, index) {
//                 final Plantas planta = tipos.obtenerPlanta()[index];
//                 return Container(
//                   margin: EdgeInsets.all(8),
//                   padding: EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Row(
//                     children: [
//                       Image.asset(planta.imagen, width: 80),
//                       SizedBox(width: 16),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(planta.name, style: TextStyle(fontWeight: FontWeight.bold)),
//                           Text(planta.cuidado),
//                         ],
//                       ),
//                       Spacer(),
// IconButton(
//                         icon: Icon(Icons.close),
//                         onPressed: () {
//                           tipos.removePlanta(planta);
//                           setState(() {});
//                         },
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 tipos.seleccionUsuario.clear();
//               });
//             },
//             child: Text('Clear Selection'),
//           ),
//         ],
//       ),
//     );
//   }
// }