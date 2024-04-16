import 'package:flutter/material.dart';
import 'package:flutter_application_1/componentes/modelos/plantas.dart';
import 'package:provider/provider.dart';

import 'modelos/tipos.dart';

class Plantaselecta extends StatefulWidget {
  Plantas plantas;
  Plantaselecta({
    super.key,
    required this.plantas,
  });

  @override
  State<Plantaselecta> createState() => _PlantaselectaState();
}

class _PlantaselectaState extends State<Plantaselecta> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 10),
      child: 
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Image.asset(widget.plantas.imagen),
          Text(widget.plantas.name, style: const TextStyle(
            color: Color.fromARGB(255, 33, 93, 35),
            fontSize: 20, 
            fontWeight: FontWeight.bold),)
        ],),
      ),
    );
  }
}