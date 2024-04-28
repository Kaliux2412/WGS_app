import 'package:flutter/material.dart';
import 'package:flutter_application_1/componentes/.env';

import 'chatmessage.dart';
  const keyO = "1";

class ChatPage extends StatefulWidget {

  @override

  _ChatPageState createState() => _ChatPageState();

}


class _ChatPageState extends State<ChatPage> {
  final OpenAIApi _openAI = OpenAIApi(apiKey: keyO);

  final TextEditingController _promptController = TextEditingController();

  final List<String> _messages = [];


  void _sendMessage() async {

    final prompt = _promptController.text;

    if (prompt.isNotEmpty) {

      try {

        final response = await _openAI.generateResponse(prompt);

        setState(() {

          _messages.insert(0, response);

        });

      } catch (e) {

        print(e);

      }

      _promptController.clear();

    }

  }


  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: Text('ChatGPT')),

      body: Column(

        children: [

          Expanded(

            child: ListView.builder(

              itemCount: _messages.length,

              itemBuilder: (context, index) {

                return ListTile(

                  title: Text(_messages[index]),

                );

              },

            ),

          ),

          Container(

            padding: EdgeInsets.symmetric(horizontal: 16),

            child: Row(

              children: [

                Expanded(

                  child: TextField(

                    controller: _promptController,

                    decoration: InputDecoration(hintText: 'Type a message'),

                  ),

                ),

                IconButton(

                  icon: Icon(Icons.send),

                  onPressed: _sendMessage,

                ),

              ],

            ),

          ),

        ],

      ),

    );

  }

}