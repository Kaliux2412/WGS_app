import 'package:flutter/material.dart';
import 'package:flutter_application_1/componentes/buscar_plantas.dart';

import '../componentes/modelos/buscar_p.dart';
//
//CODIGO QUE PROGRAMA COMO SE VERÁ EL BUSCADOR Y QUE VALORES TENDRÁ DENTRO
class SearchDelegateExample extends StatelessWidget {
  const SearchDelegateExample({Key? key}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          onTap: () {
            showSearch(
              context: context,
              delegate: SearchCountryDelegate(countries),
            );
          },
          title: const Text('Search'),
        ),
      ),
    );
  }
}