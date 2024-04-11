import 'package:flutter/material.dart';
class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
    });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      floating: false,
      pinned: true,
      shadowColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {}, 
          icon: Icon(Icons.water_drop),
          )
      ],
      collapsedHeight: 120,
      backgroundColor: Colors.white,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Padding(
        padding: EdgeInsets.only(top:25, left: 25.0),
        child: Text("Water Growth Solutions"),
      ),
      
      flexibleSpace: Column(
        children: [
          FlexibleSpaceBar(
            background: Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: child,
            ),
            title: title,
            centerTitle: true,
            titlePadding: const EdgeInsets.only(left:0, right: 0, top:0),
          ),
        ],
      ),
    );
  }
}