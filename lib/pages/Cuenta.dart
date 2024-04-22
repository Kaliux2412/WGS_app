// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/componentes/notas/helpers/database_helper.dart';
// import 'package:flutter_application_1/componentes/notas/modelos/notas.dart';
// import 'package:flutter_application_1/componentes/notas/screens/note_edit_creen.dart';
// import 'package:flutter_application_1/componentes/notas/screens/note_widget.dart';

// class NotesScreen extends StatefulWidget {
//   const NotesScreen({Key? key}) : super(key: key);

//   @override
//   State<NotesScreen> createState() => _NotesScreenState();
// }

// class _NotesScreenState extends State<NotesScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.grey[200],
//         appBar: AppBar(
//           title: const Text('Notes'),
//           centerTitle: true,
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//             await Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => const NoteScreen()));
//             setState(() {});
//           },
//           child: const Icon(Icons.add),
//         ),
//         body: FutureBuilder<List<Note>?>(
//           future: DatabaseHelper.getAllNotes(),
//           builder: (context, AsyncSnapshot<List<Note>?> snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Center(child: Text(snapshot.error.toString()));
//             } else if (snapshot.hasData) {
//               if (snapshot.data != null) {
//                 return ListView.builder(
//                   itemBuilder: (context, index) => NoteWidget(
//                     note: snapshot.data![index],
//                     onTap: () async {
//                       await Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => NoteScreen(
//                                 note: snapshot.data![index],
//                               )));
//                       setState(() {});
//                     },
//                     onLongPress: () async {
//                       showDialog(
//                           context: context,
//                           builder: (context) {
//                             return AlertDialog(
//                               title: const Text(
//                                   'Are you sure you want to delete this note?'),
//                               actions: [
//                                 ElevatedButton(
//                                   style: ButtonStyle(
//                                       backgroundColor:
//                                       MaterialStateProperty.all(
//                                           Colors.red)),
//                                   onPressed: () async {
//                                     await DatabaseHelper.deleteNote(
//                                         snapshot.data![index]);
//                                     Navigator.pop(context);
//                                     setState(() {});
//                                   },
//                                   child: const Text('Yes'),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () => Navigator.pop(context),
//                                   child: const Text('No'),
//                                 ),
//                               ],
//                             );
//                           });
//                     },
//                   ),
//                   itemCount: snapshot.data!.length,
//                 );
//               }
//               return const Center(
//                 child: Text('No notes yet'),
//               );
//             }
//             return const SizedBox.shrink();
//           },
//         )
//     );
//   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/componentes/notas/constants.dart';
// import 'package:flutter_application_1/componentes/notas/helpers/note_provider.dart';
// import 'package:flutter_application_1/componentes/notas/screens/note_edit_creen.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter/gestures.dart';


// class NoteListScreen extends StatelessWidget {
//   const NoteListScreen({super.key});

// @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//      future: Provider.of<NoteProvider>(context,listen: false).getNotes(),
//         builder: (context,snapshot)
//       {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//         else
//         {
//           if(snapshot.connectionState == ConnectionState.done)
//           {
//             return Scaffold(
//               body: Consumer<NoteProvider>(
//                 child: noNotesUI(context),
//                 builder: (context, noteprovider, child) =>
//                   noteprovider.items.length <= 0 ? child: Container(),
//               ),
//               floatingActionButton: FloatingActionButton(
//                 onPressed: () {
//                   goToNoteEditScreen(context);
//                 },
//                 child: Icon(Icons.add),
//               ),
//             );
//           }
//             return Container(
//               width: 0.0,
//               height: 0.0,
//             );
//           }
//       },
//     );
//   }
//   Widget header() {
//     return GestureDetector(
//       onTap: _launchUrl,
//       child: Container(
//         decoration: BoxDecoration(
//           color: headerColor,
//           borderRadius: BorderRadius.only(
//             bottomRight: Radius.circular(75.0),
//           ),
//         ),
//         height: 150,
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'ANDROIDRIDE\'S',
//               style: headerRideStyle,
//             ),
//             Text(
//               'NOTES',
//               style: headerNotesStyle,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   void _launchUrl() async {
//     const url = 'https://www.androidride.com';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   Widget noNotesUI(BuildContext context) {
//     return ListView(
//       children: [
//         header(),
//         Column(
//           children: [
//             RichText(
//               text: TextSpan(
//                 style: noNotesStyle,
//                 children: [
//                   TextSpan(text: ' There is no note available\nTap on "'),
//                   TextSpan(
//                       text: '+',
//                       style: boldPlus,
//                       recognizer: TapGestureRecognizer()
//                         ..onTap = () {
//                           goToNoteEditScreen(context);
//                         }),
//                   TextSpan(text: '" to add new note'),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ],
//     );
//   }
//     void goToNoteEditScreen(BuildContext context) {
//      Navigator.of(context).pushNamed(NoteEditScreen.route);
//   }
// }