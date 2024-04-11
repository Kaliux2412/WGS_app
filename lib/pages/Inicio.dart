import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
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
      children: [
        Container(
          padding: const EdgeInsets.all(1),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Colors.white,
              child: Column(
              children: [
                  Container(
                    padding: const EdgeInsets.all(1),
                    child: Image.asset('lib/Imgs/ecotec.jpg'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Nos Importa Tu Futuro', style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 41, 80, 42)),),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row( 
                      mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Productos ☘", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                        Text('Ver más', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
                      ],
                    ),
                  ),

                  const SizedBox(height: 10,),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index){
                        return const Products();
                    })
                  )
                ]

              )
            ),
          ),
        )
      ],

    );
    
  }
}