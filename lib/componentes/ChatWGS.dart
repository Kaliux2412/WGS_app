import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import '.env';

class ChatWGS extends StatefulWidget {
  const ChatWGS({super.key});

  @override
  State<ChatWGS> createState() => _ChatWGSState();
}

class _ChatWGSState extends State<ChatWGS> {
  final _openAI = OpenAI.instance.build(
    token: "1", 
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 5)), );
  final ChatUser _currentUser = 
    ChatUser(id: '1', firstName: 'WGS User');

  final ChatUser _WGSia = 
    ChatUser(id: '2', firstName: 'WGS Assistant');

  List<ChatMessage> _messages = <ChatMessage>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 255, 255, 255),title: Text('Pregunta a WGS Assistant',),centerTitle: true,),
      body:  DashChat(
        messageOptions: MessageOptions(
          currentUserContainerColor: Color.fromARGB(255, 81, 128, 82),
          textColor: Colors.white
        ),
        currentUser: _currentUser, 
        onSend: (ChatMessage m){
        getChatReponse(m);
      }, messages: _messages),
      
    );
  }
  Future<void> getChatReponse(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m);
    });
    List<Messages> _messagesHistory = _messages.reversed.map((m){
      if(m.user == _currentUser){
        return Messages(role: Role.user, content: m.text);
      }
      else{
        return Messages(role:Role.assistant, content: m.text);
      }
    }).toList();
    final request = ChatCompleteText(model:GptTurbo0301ChatModel(), messages: _messagesHistory, maxToken: 200);
    
    final response = await _openAI.onChatCompletion(request: request);
    print(response);
    for (var element in response!.choices){
      if(element.message != null){
        setState(() {
          _messages.insert(0, ChatMessage(user: _WGSia, createdAt: DateTime.now(), text: element.message!.content));
        });
      }
    }
  }
}