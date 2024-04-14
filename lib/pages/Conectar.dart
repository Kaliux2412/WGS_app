// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

// class ConectarPage extends StatelessWidget {
//   void Function(int)? onTabChange ;
//   ConectarPage({super.key, required this.onTabChange});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color.fromRGBO(36,126,65,1),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal:15, vertical:20),
//         child: GNav(
//           gap: 8,

//           backgroundColor: const Color.fromRGBO(36,126,65,1),
//           color: Colors.white,
//           activeColor: Colors.white,
//           tabBackgroundColor: Colors.green.shade400,
//           padding: const EdgeInsets.all(12),
//           tabBorderRadius: 16,
//           onTabChange:  (value) => onTabChange!(value),
//           tabs:const [
//             GButton(
//               icon: Icons.home,
//               text: "Home",
            
//             ),
//             GButton(
//               icon: Icons.eco,
//               text: 'Info',
//             ),
//             GButton(
//               icon: Icons.bluetooth,
//               text: 'Conectar',
//             ),
//             GButton(
//               icon: Icons.add_a_photo_outlined,
//               text: 'Analizar',
              
//             ),
//         ],
//         ),
//       )
      
//     );
//   }
// }
import 'package:flutter/material.dart';

class ConectarPage extends StatelessWidget {
  const ConectarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          ),
        ],
        
      ),
      
    );
  }
}