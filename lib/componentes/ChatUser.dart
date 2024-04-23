
import 'dart:async';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:velocity_x/velocity_x.dart';

import 'chatmessage.dart';

// AREA FALLIDA PARA EL CHAT DE USUARIO

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
            // if(_isTyping) const ThreeDots(),
            // const Divider(height: 1.0,),
            // Container(
            //   decoration: BoxDecoration(
            //     color: context.cardColor,
            //   ),
            //   child: _buildTextComposer(),
            // )
        ],),
      ),
    );
  }
}

