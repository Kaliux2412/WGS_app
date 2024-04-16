// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:flutter/material.dart';

// class ChatWGS extends StatefulWidget {
//   const ChatWGS({super.key});

//   @override
//   State<ChatWGS> createState() => _ChatWGSState();
// }

// class _ChatWGSState extends State<ChatWGS> {

//   final ChatUser _currentUser = 
//     ChatUser(id: '1', firstName: 'WGS User');

//   final ChatUser _ChatUser = 
//     ChatUser(id: '2', firstName: 'WGS Assistant');

//   List<ChatMessage> _messages = <ChatMessage>[];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:  DashChat(currentUser: _currentUser, onSend: (ChatMessage m){
//         getChatReponse(m);
//       }, messages: _messages),
      
//     );
//   }
//   Future<void> getChatReponse(ChatMessage m) async {
//   }
// }