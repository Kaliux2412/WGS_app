import 'package:flutter/material.dart';
// import 'package:flutter_application_1/componentes/my_drawer_cont.dart';

// import '../pages/contactos.dart';

// CONTENIDO DEL DRAWER QUE SE DESPLIEGA EN LA PARTE DE ARRIBA

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:15.0),
      child: Drawer(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
  
        child: Column(
          
          children:[
            //icono sobre la explicación de qué es Water Growth Solutions
            DrawerHeader(
              child: Image.asset(
                'lib/Imgs/icon.png',
                ),
            ),

            const Padding(
              padding: EdgeInsets.only(left:25.0),
              child: Divider(
                color: Colors.white,
                thickness: CircularProgressIndicator.strokeAlignCenter,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading:             
                Icon(
                   Icons.water_drop_rounded, 
                   color: Color.fromARGB(255, 140, 146, 142),
                  // onTap: () => Navigator.pop(context),
                ),
                title: Text('W G S', style: TextStyle(color: Color.fromARGB(255, 140, 146, 142),
)), 

                  
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading:             
                Icon(
                   Icons.call, 
                   color: Color.fromARGB(255, 140, 146, 142),
                  // onTap: () => Navigator.pop(context),
                ),
                title: Text('C O N T A C T A N O S', style: TextStyle(color: Color.fromARGB(255, 140, 146, 142),
)), 
              ),
            ),
            const SizedBox(height: 25),
            
          ],
      ),
      ),
    );
  }
}