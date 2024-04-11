import 'package:flutter/material.dart';
import 'package:flutter_application_1/componentes/botones.dart';
// import 'package:flutter_application_1/componentes/imginicio.dart';
// import 'package:flutter_application_1/componentes/sliver.dart';
import 'package:flutter_application_1/componentes/my_drawer.dart';
// import 'package:flutter_application_1/componentes/tab_controller.dart';
import 'package:flutter_application_1/pages/Analizar.dart';
import 'package:flutter_application_1/pages/Inicio.dart';

import 'Conectar.dart';
import 'Info.dart';


// import '../componentes/botones.dart';

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
  // late TabController _tabController;
  // @override
  // void initState() {
  //   super.initState();
  //   _tabController = TabController(length:4, vsync: this);
    
  // }
  // @override
  // void dispose(){
  //   _tabController.dispose();
  //   super.dispose();
  // }
  final List<Widget> _pages = [
      const Inicio(),
      
      const InfoPage(),

      const ConectarPage(),


      const AnalizarPage(),
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

        // body: NestedScrollView(
        //   headerSliverBuilder: (context, innerBoxIsScrolled) => [
        //     const MySliverAppBar(
        //       title: MyTabbedPage() ,
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.end,
        //         children: [
        //           Divider(
        //             indent: 25,
        //             endIndent: 25,
        //             color: Colors.white,
        //           ),
        //           ImgInicio()
        //         ],
      
        //       ),
              
        //     ),
        //   ],
          
        //   body: Container(color: Color.fromARGB(255, 154, 234, 144)),
          
        // ),
        
      );

  }

}

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       backgroundColor: Colors.white,
//     )
//   }
// }


