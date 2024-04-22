// // import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
// // import 'package:dash_chat_2/dash_chat_2.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_application_1/componentes/const.dart';

// // class ChatWGS extends StatefulWidget {
// //   const ChatWGS({super.key});

// //   @override
// //   State<ChatWGS> createState() => _ChatWGSState();
// // }

// // class _ChatWGSState extends State<ChatWGS> {
// //   final _openAI = OpenAI.instance.build(
// //     token: OPENAI_API_KEY,
// //     baseOption: HttpSetup(
// //       receiveTimeout: const Duration(seconds: 5),
// //     ),
// //     enableLog: true,
// //   );

// //   final ChatUser _currentUser = 
// //     ChatUser(id: '1', firstName: 'WGS User');

// //   final ChatUser _ChatUser = 
// //     ChatUser(id: '2', firstName: 'WGS Assistant');

// //   List<ChatMessage> _messages = <ChatMessage>[];
// //   List<ChatUser> _typingUsers = <ChatUser>[];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body:  DashChat(currentUser: _currentUser, typingUsers: _typingUsers, messageOptions: const MessageOptions(
// //         currentUserContainerColor: Color.fromARGB(255, 21, 70, 23),
// //         containerColor: Color.fromARGB(255, 116, 156, 82),
// //         textColor: Colors.white,
// //       ),
// //       onSend: (ChatMessage m){
// //         getChatReponse(m);
// //       }, messages: _messages),
      
// //     );
// //   }
// //   Future<void> getChatReponse(ChatMessage m) async {
// //     setState(() {
// //       _messages.insert(0, m);
// //       _typingUsers.add(_ChatUser);
// //     });
// //     List<Messages> _messagesHistory = _messages.reversed.map((m){
// //       if (m.user == _currentUser) {
// //         return Messages(role: Role.user, content: m.text);
// //       } else {
// //         return Messages(role: Role.assistant, content: m.text);
// //       }
// //     }).toList();
// //     final request = ChatCompleteText(
// //       model: GptTurbo0301ChatModel(),
// //       messages: _messagesHistory,
// //       maxToken: 200,
// //     );
// //         final response = await _openAI.onChatCompletion(request: request);
// //     for (var element in response!.choices) {
// //       if (element.message != null) {
// //         setState(() {
// //           _messages.insert(
// //             0,
// //             ChatMessage(
// //                 user: _ChatUser,
// //                 createdAt: DateTime.now(),
// //                 text: element.message!.content),
// //           );
// //         });
// //       }
// //     }
// //     setState(() {
// //       _typingUsers.remove(_ChatUser);
// //     });
// //   }
// // }



// // import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
// // import 'package:dash_chat_2/dash_chat_2.dart';
// // import 'package:flutter/material.dart';
// // import 'const.dart';

// // class ChatPage extends StatefulWidget {
// //   const ChatPage({super.key});

// //   @override
// //   State<ChatPage> createState() => _ChatPageState();
// // }

// // class _ChatPageState extends State<ChatPage> {
// //   final _openAI = OpenAI.instance.build(
// //     token: OPENAI_API_KEY,
// //     baseOption: HttpSetup(
// //       receiveTimeout: const Duration(
// //         seconds: 5,
// //       ),
// //     ),
// //     enableLog: true,
// //   );

// //   final ChatUser _currentUser =
// //       ChatUser(id: '1', firstName: 'Hussain', lastName: 'Mustafa');

// //   final ChatUser _gptChatUser =
// //       ChatUser(id: '2', firstName: 'Chat', lastName: 'GPT');

// //   List<ChatMessage> _messages = <ChatMessage>[];
// //   List<ChatUser> _typingUsers = <ChatUser>[];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: const Color.fromRGBO(
// //           0,
// //           166,
// //           126,
// //           1,
// //         ),
// //         title: const Text(
// //           'GPT Chat',
// //           style: TextStyle(
// //             color: Colors.white,
// //           ),
// //         ),
// //       ),
// //       body: DashChat(
// //           currentUser: _currentUser,
// //           typingUsers: _typingUsers,
// //           messageOptions: const MessageOptions(
// //             currentUserContainerColor: Colors.black,
// //             containerColor: Color.fromRGBO(
// //               0,
// //               166,
// //               126,
// //               1,
// //             ),
// //             textColor: Colors.white,
// //           ),
// //           onSend: (ChatMessage m) {
// //             getChatResponse(m);
// //           },
// //           messages: _messages),
// //     );
// //   }

// //   Future<void> getChatResponse(ChatMessage m) async {
// //     setState(() {
// //       _messages.insert(0, m);
// //       _typingUsers.add(_gptChatUser);
// //     });
// //     List<Messages> _messagesHistory = _messages.reversed.map((m) {
// //       if (m.user == _currentUser) {
// //         return Messages(role: Role.user, content: m.text);
// //       } else {
// //         return Messages(role: Role.assistant, content: m.text);
// //       }
// //     }).toList();
// //     final request = ChatCompleteText(
// //       model: GptTurbo0301ChatModel(),
// //       messages: _messagesHistory,
// //       maxToken: 200,
// //     );
// //     final response = await _openAI.onChatCompletion(request: request);
// //     for (var element in response!.choices) {
// //       if (element.message != null) {
// //         setState(() {
// //           _messages.insert(
// //             0,
// //             ChatMessage(
// //                 user: _gptChatUser,
// //                 createdAt: DateTime.now(),
// //                 text: element.message!.content),
// //           );
// //         });
// //       }
// //     }
// //     setState(() {
// //       _typingUsers.remove(_gptChatUser);
// //     });
// //   }
// // }
// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:velocity_x/velocity_x.dart';

// import 'chatmessage.dart';
// import 'threedots.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _controller = TextEditingController();
//   final List<ChatMessage> _messages = [];
//   late OpenAI? chatGPT;
//   bool _isImageSearch = false;

//   bool _isTyping = false;

//   @override
//   void initState() {
//     chatGPT = OpenAI.instance.build(
//         token: dotenv.env["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"],
//         baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)));
//     super.initState();
//   }

//   @override
//   void dispose() {
//     chatGPT?.close();
//     chatGPT?.genImgClose();
//     super.dispose();
//   }

//   // Link for api - https://beta.openai.com/account/api-keys

//   void _sendMessage() async {
//     if (_controller.text.isEmpty) return;
//     ChatMessage message = ChatMessage(
//       text: _controller.text,
//       sender: "user",
//       isImage: false,
//     );

//     setState(() {
//       _messages.insert(0, message);
//       _isTyping = true;
//     });

//     _controller.clear();

//     if (_isImageSearch) {
//       final request = GenerateImage(message.text, 1, size: "256x256");

//       final response = await chatGPT!.generateImage(request);
//       Vx.log(response!.data!.last!.url!);
//       insertNewData(response.data!.last!.url!, isImage: true);
//     } else {
//       final request =
//           CompleteText(prompt: message.text, model: kChatGptTurbo0301Model);

//       final response = await chatGPT!.onCompleteStream¿(request: request);
//       Vx.log(response!.choices[0].text);
//       insertNewData(response.choices[0].text, isImage: false);
//     }
//   }

//   void insertNewData(String response, {bool isImage = false}) {
//     ChatMessage botMessage = ChatMessage(
//       text: response,
//       sender: "bot",
//       isImage: isImage,
//     );

//     setState(() {
//       _isTyping = false;
//       _messages.insert(0, botMessage);
//     });
//   }

//   Widget _buildTextComposer() {
//     return Row(
//       children: [
//         Expanded(
//           child: TextField(
//             controller: _controller,
//             onSubmitted: (value) => _sendMessage(),
//             decoration: const InputDecoration.collapsed(
//                 hintText: "Question/description"),
//           ),
//         ),
//         ButtonBar(
//           children: [
//             IconButton(
//               icon: const Icon(Icons.send),
//               onPressed: () {
//                 _isImageSearch = false;
//                 _sendMessage();
//               },
//             ),
//             TextButton(
//                 onPressed: () {
//                   _isImageSearch = true;
//                   _sendMessage();
//                 },
//                 child: const Text("Generate Image"))
//           ],
//         ),
//       ],
//     ).px16();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: const Text("Pregunta a WGS Assistant")),
//         body: SafeArea(
//           child: Column(
//             children: [
//               Flexible(
//                   child: ListView.builder(
//                 reverse: true,
//                 padding: Vx.m8,
//                 itemCount: _messages.length,
//                 itemBuilder: (context, index) {
//                   return _messages[index];
//                 },
//               )),
//               if (_isTyping) const ThreeDots(),
//               const Divider(
//                 height: 1.0,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   color: context.cardColor,
//                 ),
//                 child: _buildTextComposer(),
//               )
//             ],
//           ),
//         ));
//   }
// }