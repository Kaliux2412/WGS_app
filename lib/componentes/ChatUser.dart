
import 'dart:async';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:velocity_x/velocity_x.dart';

import 'chatmessage.dart';
import 'threedots.dart';


class ChatScreenState extends StatefulWidget {
  const ChatScreenState({super.key});

  @override
  State<ChatScreenState> createState() => _ChatScreenStateState();
}

class _ChatScreenStateState extends State<ChatScreenState> {

  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  OpenAI? chatGPT;
  StreamSubscription? _subscription;
  bool _isTyping = false;

  @override
  void initState(){
    super.initState();

    // Cargar variables de entorno desde el archivo .env
    // dotenv.load(fileName: "lib/componentes/.env").then((value) {
    //   String? apiKey = dotenv.env["sk-proj-cZ5Ze67CrNyD1Q6V4CVIT3BlbkFJowzXN7Pbkf6EXNAZANd6"];
    //   print (apiKey);

    //   if (apiKey != null) {
    //     // Inicializar el objeto OpenAI con el token de API
    //     chatGPT = OpenAI.instance.build(
    //       token: apiKey,
    //       baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
    //     );
    //   } else {
    //     // Manejar el caso en que el token de API no esté disponible
    //     print("No se encontró el token de API de OpenAI en el archivo .env");
    //   }
    // });
    chatGPT = OpenAI.instance;
  }
  @override
  void dispose(){
    _subscription?.cancel();
    super.dispose();
  }

  void _sendMessage() {

    ChatMessage message = ChatMessage(text: _controller.text, sender: "Usuario WGS");
    setState(() {
      _messages.insert(0, message);
      _isTyping = true;
    });
    _controller.clear();
    final request = CompleteText(prompt: message.text, model: 'gpt-3.5-turbo', maxTokens: 200,);
     chatGPT = OpenAI.instance;
    _subscription = chatGPT!.build(token: "sk-proj-cZ5Ze67CrNyD1Q6V4CVIT3BlbkFJowzXN7Pbkf6EXNAZANd6",)
    .onCompletionStream(request: request).listen((response) {
      Vx.log(response!.choices[0].text);
      
      ChatMessage assistantMessage = ChatMessage(text: response.choices[0].text, sender: "Asistente",);

      setState(() {
        _isTyping = false;
        _messages.insert(0, assistantMessage);
      });
     });
    
  }

  Widget _buildTextComposer(){
    return  Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onSubmitted: (value) => _sendMessage(),
            decoration: InputDecoration.collapsed(hintText: "Manda un mensaje"),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed:() => _sendMessage(),
        )
    ],).px16();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Pregunta a WGS Assistant", style: TextStyle(color: Colors.white),),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                reverse: true,
                padding: Vx.m8,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _messages[index];
                }
              )
            ),
            if(_isTyping) const ThreeDots(),
            const Divider(height: 1.0,),
            Container(
              decoration: BoxDecoration(
                color: context.cardColor,
              ),
              child: _buildTextComposer(),
            )
        ],),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'chatservice.dart';


// class ChatScreen extends StatefulWidget {
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   TextEditingController _controller = TextEditingController();
//   String _response = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ChatGPT Bot'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView(
//               children: [
//                 ListTile(
//                   title: Text('$_response'),
//                 ),
//               ],
//             ),
//           ),
//           TextField(
//             controller: _controller,
//             decoration: InputDecoration(
//               hintText: 'Type a message...',
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               String message = _controller.text;
//               String apiKey = 'sk-proj-cZ5Ze67CrNyD1Q6V4CVIT3BlbkFJowzXN7Pbkf6EXNAZANd6';
//               try {
//                 String response = await sendMessageToChatGPT(message, apiKey);
//                 setState(() {
//                   _response = response;
//                 });
//               } catch (e) {
//                 setState(() {
//                   _response = 'Error: $e';
//                 });
//               }
//             },
//             child: Text('Send'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/componentes/chatmessage.dart';

// class ChatUser extends StatefulWidget {
//   const ChatUser({super.key});

//   @override
//   State<ChatUser> createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatUser> {
//   String response = "";
//   TextEditingController _controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 255, 255, 255),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 99, 51, 195),
//         centerTitle: true,
//         title: Text("CHAT WGS"),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: 400,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Color.fromARGB(106, 31, 181, 146)),
//                 child: TextField(
//                   controller: _controller,
//                   maxLines: null,
//                   cursorColor: const Color.fromARGB(255, 126, 46, 46),
//                   style: TextStyle(color: Colors.white),
//                   decoration: InputDecoration(
//                       contentPadding: EdgeInsets.all(5.0),
//                       border: InputBorder.none),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Color.fromARGB(255, 206, 239, 149)),
//                       onPressed: () async{
//                         var res = await sendChatCompletionRequest(_controller.text);
//                         response = res["choices"][0]["text"];
//                         setState(() {});
//                       },

//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "Enviar request",
//                       style: TextStyle(fontSize: 24, color: Colors.white),
          
//                     ),
//                   )),
//               Container(
//                 width: 500,
//                 child:  Text(
//                   response,
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 24,
//                       color: Color.fromARGB(255, 70, 147, 188)),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


