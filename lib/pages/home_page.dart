import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/componentes/AreaNotas.dart';
import 'package:flutter_application_1/componentes/botones.dart';
import 'package:flutter_application_1/componentes/my_drawer.dart';
import 'package:flutter_application_1/pages/Barra_de_Busqueda.dart';
import 'package:flutter_application_1/pages/CuidaPlanta/Analizar.dart';
import 'package:flutter_application_1/pages/Inicio.dart';
import 'package:flutter_application_1/componentes/ChatUser.dart';

import 'Conectar.dart';


// AREA QUE CONTROLA LA INTERFAZ DE BOTONES DE NAVEGACIÓN DE LA APRTE DE ABAJO, DE LA APP
class HomePage extends StatefulWidget {
  const HomePage({super. key});
  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void navigateBottonBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  final List<Widget> _pages = [
      const Inicio(),
      
      const ChatScreenState(),

      const ConectarPage(),

      const NoteHomeUI(),

      AppWidget(),
  ];
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        bottomNavigationBar: NavBarBotones(
          onTabChange: (index) => navigateBottonBar(index),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                );
            }
          ),
        ),
        body: _pages[_selectedIndex],
        drawer: const MyDrawer(),
      );

  }

}


