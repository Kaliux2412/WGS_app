import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/componentes/buscar_plantas.dart';
import 'package:flutter_application_1/componentes/modelos/plantas.dart';
import 'package:provider/provider.dart';

import '../componentes/Products.dart';
import '../componentes/modelos/buscar_p.dart';
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
// ÁREA DE BUSCADOR:
  
  @override
  Widget build(BuildContext context) {
        final List<Country> countries = [
          const Country('Tomate'),
          const Country('Limón'),
          const Country('Nopal'),
          const Country('Fresa'),
          const Country('Pimiento'),
          const Country('Huerto'),
          const Country('Lechuga'),
          const Country('Naranja'),
          const Country('Arandano'),
          const Country('Mango'),
        ];
    return  Consumer<Tipos>(builder: (context, value, child) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            iconColor: Colors.teal,
            onTap: (){
              showSearch(context: context, delegate: SearchCountryDelegate(countries));
            },
            title: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 83, 190, 98),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Buscar: ',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
//IMG
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
                      
                    ],
                  ),
                ),
              
            
        // AREA QUE ESPECIFICA EL CUIDADO DE LA PLANTA
        
          const SizedBox(height: 6,),
          Expanded(
            child: ListView.builder(
              itemCount: 8,
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
