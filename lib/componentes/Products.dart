import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/componentes/modelos/plantas.dart';

// ignore: must_be_immutable
class Products extends StatelessWidget {
    Plantas plantas;
    Products({super.key, required this.plantas});
  
    @override
    Widget build(BuildContext context) {
      return Container(
        margin: EdgeInsets.only(left: 25),
        width: 280,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(plantas.imagen)
            ),

            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                plantas.cuidado,
                style: const TextStyle(
                  fontSize: 10,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plantas.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5,),
              
                      Text(plantas.descripcion, style: const TextStyle(color: Colors.grey))
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 61, 145, 64),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomRight: Radius.circular(12))
                    ),
                    child: const Icon(Icons.info_outline, color: Colors.white,),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }
}