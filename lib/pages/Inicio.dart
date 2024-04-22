import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/componentes/modelos/plantas.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_application_1/componentes/sliver.dart';

import '../componentes/Products.dart';
import '../componentes/modelos/tipos.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  //añadir a info
  void addPlantaToInfo(Plantas plantas){
    Provider.of<Tipos>(context, listen: false).addPlanta(plantas);
  //alerta de redirección
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Ir a sección de Info"),
   ),
  );
}
  
  @override
  Widget build(BuildContext context) {
    return  Consumer<Tipos>(builder: (context, value, child) =>
      Column(
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
          // Container(
          //   child: Expanded(

          //     child: SingleChildScrollView(
          //         scrollDirection: Axis.vertical,

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
                      
                    ],
                  ),
                ),
              
            
          
          const SizedBox(height: 6,),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              physics:AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder:(context, index) {
              
                Plantas plantas = value.obtenerinventario()[index];
                return Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Products(
                      plantas: plantas,
                      onTap: () => addPlantaToInfo(plantas),
                    ),
                  ),
                );
              },
              ),
              
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18.0, left: 20, right: 20),
            child: Divider(
              color: Colors.white,
            ),
          )
        ],

      )
      
    );
  }
}
