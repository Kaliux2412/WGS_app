// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_application_1/componentes/ChatWGS.dart';
// import 'package:flutter_application_1/componentes/const.dart';
// import 'package:flutter_application_1/componentes/modelos/plantas.dart';
// import 'package:provider/provider.dart';

// import '../componentes/modelos/tipos.dart';
// import '../componentes/planta_selecta.dart';

// class InfoPage extends StatefulWidget {
//   const InfoPage({super.key});

//   @override
//   State<InfoPage> createState() => _InfoState();
// }

// class _InfoState extends State<InfoPage> {

  // final _Assistant = OpenAI.instance.build(
  //   token: OPENAI_API_KEY,
  //   baseOption: HttpSetup(
  //     receiveTimeout: const Duration(seconds: 5,) 
  //   ),
  //   enableLog: true,
  // );

  // final ChatUser _currentUser = 
  //   ChatUser(id: '1', firstName: 'WGS User');

  // final ChatUser _ChatUser = 
  //   ChatUser(id: '2', firstName: 'WGS Assistant');

  // List<ChatMessage> _messages = <ChatMessage>[];
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Colors.green,
  //       title: Text("Pregunta a WGS Assistant", style: TextStyle(color: Colors.white),),
  //     ),
  //     body: Column()
      
  //   );
    // return  Consumer<Tipos>(builder: (context, value, child)=>
    //   Padding(
    //     padding: EdgeInsets.symmetric(horizontal: 25.0),
    //     child: Column(
    //       children: [
    //         const Text(
    //           'Especificaciones', 
    //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    //         ),

    //         const SizedBox(height: 10),
    //         // Expanded( 
    //         //   child: ListView.builder(
    //         //     scrollDirection: Axis.horizontal,
    //         //     itemCount: value.obtenerPlanta().length,
    //         //     itemBuilder: (context, index){
    //         //       Plantas individualplanta = value.obtenerPlanta()[index];
    //         //       return Plantaselecta(plantas: individualplanta,);
    //         //     },
    //         //   ),
    //         // ),
    //         Container(
    //           child:  DashChat(currentUser: _currentUser, onSend: (ChatMessage m){
    //             getChatReponse(m);
    //           }, messages: _messages),
    //         ),

    //         // Expanded(
    //         //   child: ListView.builder(itemBuilder: (context, index){
    //         //     Plantas 
    //         //   }),)
    //       ],
    //     ),
    //   )
    // );
    
  // }
  // Future<void> getChatReponse(ChatMessage m) async {
  //   setState(() {
  //     _messages.insert(0, m);
  //   });
    
  // }
// }

