// import 'package:flutter/material.dart';

// import 'package:flutter/rendering.dart';

// import 'package:flutter/widgets.dart';

// import 'package:flutter_application_1/componentes/modelos/Circuitos.dart';

// import 'package:flutter_application_1/componentes/Products.dart';


// class Inicio extends StatefulWidget {

//   const Inicio({super.key});

//   @override
//   State<Inicio> createState() => _InicioState();
// }


// class _InicioState extends State<Inicio> {
//   @override
//   Widget build(BuildContext context) {

//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Expanded(
//           fit: FlexFit.loose,
//           child: Container(
//             padding: const EdgeInsets.all(1),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Container(
//                 color: Colors.white,
//                 child: Column(
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(1),
//                       child: Image.asset('lib/Imgs/ecotec.jpg'),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('Nos Importa Tu Futuro', style: TextStyle(fontSize: 22, color: Color.fromARGB(255, 41, 80, 42)),),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 25.0),
//                       child: Row(
//                         mainAxisAlignment:MainAxisAlignment.spaceBetween ,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Text("Productos ☘", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//                           Text('Ver más', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
//                         ],

//                       ),

//                     ),
//                     const SizedBox(height: 10,),

//                     Expanded(

//                       flex: 1,

//                       child: Padding(

//                         padding: const EdgeInsets.all(8.0),

//                         child: Container(

//                           height: 200,

//                           padding: const EdgeInsets.all(1),

//                           child: ListView.builder(

//                             itemCount: 4,

//                             scrollDirection: Axis.horizontal,

//                             itemBuilder: (context, index){

//                               Circuitos circuitos = new Circuitos(
//                                 name: 'Huerto Clasico',
//                                 imagen: 'lib/Imgs/ecotec.png',
//                                 descripcion: "El mejor huerto",
//                                 precio: '3',
//                                 );
//                               );
//                             } ,
//                           )  
//                         )
//                       )
//                     )
//                   ]
//                 )
//               )
//             )
//           )
//         )
//       ]
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/componentes/modelos/plantas.dart';
// import 'package:flutter_application_1/componentes/sliver.dart';

import '../componentes/Products.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 186, 234, 178),
            borderRadius: BorderRadius.circular(8)
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Buscar', style: TextStyle(color: Colors.grey),),
              Icon(Icons.search, color:  Color.fromARGB(255, 41, 136, 24)
            ),],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Text('WGS te ayudará a tener el control y cuidado de tus plantas', style: TextStyle(color: Colors.grey),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: SizedBox(
            height: 100,
            width: 500,
            child: Image.asset(
            'lib/Imgs/WGS.png',
            fit: BoxFit.cover,
            ),
          )
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Cuidado de tus plantas ☘",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                'Ver detalles',
                style:TextStyle(
                  fontSize: 12,
                  color: Colors.green,
                ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 10,),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder:(context, index) {
              Plantas plantas = Plantas(name: "Tomates", cuidado: "Ponle agua, cada 3 días de 4 a 5 litros", imagen: "lib/Imgs/huertos.jpg", descripcion: 'Requiere de poca atención');
              return Products(plantas: plantas);
            },
            ),
            
        ),
        const Padding(
          padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
          child: Divider(
            color: Colors.white,
          ),
        )
        // Flex(
        //   direction: Axis.horizontal,
        //   children: [
        //     Flexible(
        //     fit: FlexFit.loose,
        //     child: 
          
        //     Container(
        //       padding: const EdgeInsets.all(1),
        //       child: ClipRRect(
        //         borderRadius: BorderRadius.circular(10),
        //         child: Container(
        //           color: Colors.white,
        //           child: Column(
        //           children: [
        //               Container(
        //                 width: double.infinity,
        //                 padding: const EdgeInsets.all(1),
        //                 child: Image.asset('lib/Imgs/ecotec.jpg'),
        //               ),
        //               const Padding(
        //                 padding: EdgeInsets.all(8.0),
        //                 child: Text('Nos Importa Tu Futuro', style: TextStyle(fontSize: 22, color: Color.fromARGB(255, 41, 80, 42)),),
        //               ),
        //               const Padding(
        //                 padding: EdgeInsets.symmetric(horizontal: 25.0),
        //                 child: Row( 
        //                   mainAxisAlignment:MainAxisAlignment.spaceBetween ,
        //                   crossAxisAlignment: CrossAxisAlignment.end,
        //                   children: [
        //                     Text("Productos ☘", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        //                     Text('Ver más', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
        //                   ],
        //                 ),
        //               ),

                      
        //               // Expanded(
        //               //   flex: 1,
        //               //   child: Padding(
        //               //     padding: const EdgeInsets.all(8.0),
        //               //     child: Container(
        //               //       height: 200,
        //               //       padding: const EdgeInsets.all(1),
        //               //       child: ListView.builder(
        //               //         itemCount: 4,
        //               //         scrollDirection: Axis.horizontal,
        //               //         itemBuilder: (context, index){
        //               //           Circuitos circuitos = Circuitos(
        //               //             name: 'Huerto Clasico',
        //               //             precio: '3,400 pesos',
        //               //             imagen: 'lib/Imgs/huertos.jpg', 
        //               //             descripcion: 'El huerto que tienes ahora');
        //               //           return Products(
        //               //             circuitos: circuitos,
        //               //             );
        //               //         }
        //               //     )
        //               //     ),
        //               //   ),
        //               // ),
        //               Row(
        //                 children: [
        //                   CustomScrollView(
        //                     slivers: [
        //                       ListView.builder(
                            
        //                       itemBuilder: (context, index) {
        //                         Circuitos circuitos = Circuitos(
        //                           name: "Tomate", 
        //                           cuidado: "ponle agua", 
        //                           imagen: "lib/Imgs/ecotec.jpg", 
        //                           descripcion: "hola");
        //                         return Products(
        //                           circuitos: circuitos,
        //                         );
        //                       },
        //                     ),
        //                     ],
        //                   ),
                          
        //                 ],
        //               ),
        //               const Padding(
        //                 padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
        //                 child: Divider(
        //                   color: Colors.white,
        //                 ),
        //               )
        //             ]
        //           )
        //         ),
        //       ),
        //     ) 
        //   )
        //   ],
        // )
      ],

    );
    
  }
}
