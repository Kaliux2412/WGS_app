import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(
      {super.key,
      required this.text,
      required this.sender,
      });

  final String text;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(sender)
            .text
            .subtitle1(context)
            .make()
            .box
            .color(sender == "user" ? Vx.red200 : Vx.green200)
            .p16
            .rounded
            .alignCenter
            .makeCentered(),
        Expanded(
          child: text.trim().text.bodyText1(context).make().px8(),
        ),
      ],
    ).py8();
  }
}
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// Future<String> sendMessageToChatGPT(String message, String apiKey) async {
//   final Map<String, dynamic> requestBody = {
//     'prompt': message,
//     'max_tokens': '50', // Ajusta el número máximo de tokens de acuerdo a tus necesidades
//   };

//   final response = await http.post(
//     Uri.parse('https://api.openai.com/v1/completions'),
//     headers: {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $apiKey',
//     },
//     body: jsonEncode(requestBody), // Convertir el cuerpo a JSON
//   );

//   if (response.statusCode == 200) {
//     return response.body;
//   } else {
//     throw Exception('Failed to send message to ChatGPT: ${response.statusCode}');
//   }
// }

// import 'dart:convert';

// import 'package:http/http.dart' as http;


// String apiKey = "sk-proj-cZ5Ze67CrNyD1Q6V4CVIT3BlbkFJowzXN7Pbkf6EXNAZANd6";

// Future sendTextCompletionRequest(String message) async {
//   String baseUrl = "https://api.openai.com/v1/completions";
//   Map<String, String> headers = {
//     "Content-Type": "application/json",
//     "Authorization": "Bearer $apiKey"
//   };
//   var res = await http.post(Uri.parse(baseUrl),
//       headers: headers,
//       body: json.encode({
//         "model": "text-davinci-003",
//         "prompt": message,
//         "max_tokens": 200,
//         "temperature": 0,
//         "top_p": 1,
//         "n": 1,
//         "stream": false,
//         "logprobs": null,
//       }));
//   if (res.statusCode == 200) {
//     return jsonDecode(res.body);
//   }
// }

// Future sendChatCompletionRequest(
//     String message) async {
  

//   final apiKey = "sk-proj-cZ5Ze67CrNyD1Q6V4CVIT3BlbkFJowzXN7Pbkf6EXNAZANd6";
//   String baseUrl = "https://api.openai.com/v1/chat/completions";
//   Map<String, String> headers = {
//     "Content-Type": "application/json; charset=UTF-8",
//     "Authorization": "Bearer $apiKey"
//   };


//   var res = await http.post(Uri.parse(baseUrl),
//       headers: headers,
//       body: json.encode({
//         "model": "gpt-3.5-turbo",
//         "messages": [
     
//           {"role": "user", "content": message}
//         ]
//       }));

//   if (res.statusCode == 200) {
//     final resultBody = utf8.decode(res.bodyBytes);
//     final String result =
//         jsonDecode(resultBody)["choices"][0]["message"]["content"];

//     return result.trim();
//   }
// } 