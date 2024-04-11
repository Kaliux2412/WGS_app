import 'package:flutter/material.dart';

// class MyTabBar extends StatelessWidget {
//   final TabController tabController;

//   const MyTabBar({
//     super.key,
//     required this.tabController,
    
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TabBar(
//       controller: tabController,
//       tabs: const [
//         Tab(
//           icon: Icon(Icons.home),
//         ),
//         Tab(
//           icon: Icon(Icons.eco,),
//         ),
//         Tab(
//           icon: Icon(Icons.bluetooth),
//         ),
//         Tab(
//           icon: Icon(Icons.add_a_photo_outlined),
//         ),
//       ],
//     );
//   }
// }

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({ super.key });
  @override
  State<MyTabbedPage> createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage> with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

 @override
 void dispose() {
   _tabController.dispose();
   super.dispose();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          final String label = tab.text!.toLowerCase();
          return Center(
            child: Text(
              'This is the $label tab',
              style: const TextStyle(fontSize: 36),
            ),
          );
        }).toList(),
      ),
    );
  }
}