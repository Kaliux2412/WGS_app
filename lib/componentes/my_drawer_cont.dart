import 'package:flutter/material.dart';


// SE AGREGARAN LOS ICONOS DEL DRAWER
class MyDrawerCont extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;

  const MyDrawerCont({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:25.0),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(color:Colors.white)
        ),
        leading: Icon(icon, 
        color: Colors.white
        ),
        onTap: onTap,
      ),
    );
  }
}