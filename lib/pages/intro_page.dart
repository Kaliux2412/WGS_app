
import 'package:flutter/material.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage ({super.key});
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      
      backgroundColor: Color.fromARGB(255, 232, 255, 224),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:30.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                'lib/Imgs/icon.png',
                  height: 190,
                  width: 190,
                ),
              ),
              //title
              const Text(
                'Bienvenido A...',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AutofillHints.addressCityAndState,
                  color: Color.fromARGB(255, 136, 135, 135),
                ),
              ),
              const SizedBox(height: 35,),
              //title
              const Text(
                'WATER GROWTH SOLUTIONS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 51, 86, 14)
                ),
              ),
              const SizedBox(height: 24,),
          
              const Text(
                'Cultivando abundancia, regando esperanza.',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: AutofillHints.addressCityAndState,
                  color: Color.fromARGB(255, 136, 135, 135),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48,),
              //Boton de Inicio
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  const HomePage()
                    ),
                ),
                child: Container(
                  width: 320,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(157,180,93, 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: const Center(
                    child: Text(
                      'Ir a pagina de Inicio',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight:FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
          
            ],),
        )),

    );
  }
}