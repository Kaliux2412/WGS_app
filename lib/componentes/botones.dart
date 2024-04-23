import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

//CONFIGURACIÓN DE DISEÑO DE BOTONES DE LA PARTE INFERIOR


// ignore: must_be_immutable
class NavBarBotones extends StatelessWidget {
  void Function(int)? onTabChange ;
  NavBarBotones({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(36,126,65,1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:15, vertical:20),
        child: GNav(
          gap: 8,

          backgroundColor: const Color.fromRGBO(36,126,65,1),
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.green.shade400,
          padding: const EdgeInsets.all(12),
          tabBorderRadius: 16,
          onTabChange:  (value) => onTabChange!(value),
          tabs:const [
            GButton(
              icon: Icons.home,
              text: "Home",
            
            ),
            GButton(
              icon: Icons.eco,
              text: 'Info',
            ),
            GButton(
              icon: Icons.bluetooth,
              text: 'Conectar',
            ),
            GButton(
              icon: Icons.note_alt_outlined,
              text: 'Registrar',
              
            ),
            GButton(
              icon: Icons.account_circle,
              text: 'Cuenta',
              
            ),
        ],
        ),
      ),
    );
  }
}