import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/componentes/imageset.dart';

import 'NoteDbHelper.dart';
import 'DescNotas.dart';

//AREA VISUAL DONDE SE GUARDAN LAS NOTAS


class NoteHomeUI extends StatefulWidget {
  const NoteHomeUI({super.key});

  @override
  State<NoteHomeUI> createState() => _NoteHomeUIState();
}

class _NoteHomeUIState extends State<NoteHomeUI> {
  ///////////////////////////insert database/////////////////////////////
  insertdatabase(tittle, description) {
    NoteDbHelper.instance.insert({
      NoteDbHelper.coltittle: tittle,
      NoteDbHelper.coldescription: description,
      NoteDbHelper.coldate: DateTime.now().toString(),
    });
  }

  updatedatabase(snap, index, tittle, description) {
    NoteDbHelper.instance.update({
      NoteDbHelper.colid: snap.data![index][NoteDbHelper.colid],
      NoteDbHelper.coltittle: tittle,
      NoteDbHelper.coldescription: description,
      NoteDbHelper.coldate: DateTime.now().toString(),
    });
  }

  deletedatabase(snap, index) {
    NoteDbHelper.instance.delete(snap.data![index][NoteDbHelper.colid]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.07,
          title: const Text('Note App')),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children:[ 
            const SizedBox(height: 10,),
            Expanded(
              child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              
              child: FutureBuilder(
                future: NoteDbHelper.instance.queryAll(),
                builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snap) {
                  if (snap.hasData) {
                    return ListView.builder(
                      itemCount: snap.data!.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            deletedatabase(snap, index);
                          },
                          background: Container(
                              color: Colors.red, child: const Icon(Icons.delete)),
                          child: Card(
                            child: ListTile(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return DescriptionNote(
                                        tittle: snap.data![index]
                                            [NoteDbHelper.coltittle],
                                        description: snap.data![index]
                                            [NoteDbHelper.coldescription]);
                                  },
                                ));
                        
                                //
                              },
                              leading: IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        
                                        var tittle = '';
                                        var description = '';
                                        return AlertDialog(
                                          title: const Text('Edit Note'),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              TextField(
                                                onChanged: (value) {
                                                  tittle = value;
                                                },
                                                decoration: InputDecoration(
                                                    hintText: snap.data![index]
                                                        [NoteDbHelper.coltittle]),
                                              ),
                                              TextField(
                                                  onChanged: (value) {
                                                    description = value;
                                                  },
                                                  decoration: InputDecoration(
                                                      hintText: snap.data![index][
                                                          NoteDbHelper
                                                              .coldescription])),
              
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Cancel')),
                                            TextButton(
                                                onPressed: () {
                                                  updatedatabase(snap, index,
                                                      tittle, description);
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Save'))
                                          ],
                                        );
                                      },
                                    );
                                    //
                                  },
                                  icon: Icon(Icons.edit)),
                              title:
                                  Text(snap.data![index][NoteDbHelper.coltittle]),
                              subtitle: Text(
                                  snap.data![index][NoteDbHelper.coldescription]),
                              trailing: Text(snap.data![index][NoteDbHelper.coldate]
                                  .toString()
                                  .substring(0, 10)),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                        // child: CircularProgressIndicator(),
                        );
                  }
                },
              ),
                        ),
            ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              var tittle = '';
              var description = '';
              return AlertDialog(
                title: const Text('Add Note'),
                content: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextField(
                        onChanged: (value) {
                          tittle = value;
                        },
                        decoration: const InputDecoration(hintText: 'Title')),
                    TextField(
                        onChanged: (value) {
                          description = value;
                        },
                        decoration:
                            const InputDecoration(hintText: 'Description')),
                    CameraGalleryWidget(onImageSelected: (File image){
                      showDialog(context: context, builder: (context){
                        return FirebaseUploadWidget(image: image);
                        });
                    })
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel')),
                  TextButton(
                      onPressed: () {
                        insertdatabase(tittle, description);
                        Navigator.pop(context);
                      },
                      child: const Text('Save'))
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
        
      ),
    );
  }
}