import 'package:flutter/material.dart';
import 'widgets.dart';

class DatosPlanta extends StatelessWidget{
  const DatosPlanta({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppBarTitle(),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Datos de tu Planta',style: Theme.of(context).textTheme.headlineMedium,),
              SizedBox(
                height: 45,
              ),
              PlantImage(),
              SizedBox(

              )
            ],
          ),
        ),
      ),
    );
  }
}