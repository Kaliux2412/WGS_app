import 'dart:convert';

import 'package:http/http.dart' as http;


class OpenAIApi {

  final String apiKey;

  final String baseUrl = 'https://api.openai.com/v1';


  OpenAIApi({required this.apiKey});


  Future<String> generateResponse(String prompt) async {

    final request = http.Request('POST', Uri.parse('$baseUrl/chat/completions'));

    request.headers['Content-Type'] = 'application/json';

    request.headers['Authorization'] = 'Bearer $apiKey';


    final jsonBody = json.encode({

      "model": "gpt-3.5-turbo-0301",

      "messages": [

        {"role": "system", "content": "You are a helpful assistant."},

        {"role": "user", "content": prompt},

      ],

      "max_tokens": 200,

    });


    request.body = jsonBody;


    http.StreamedResponse response = await request.send();


    if (response.statusCode == 200) {

      final responseString = await response.stream.transform(utf8.decoder).join();

      final responseData = json.decode(responseString);

      return responseData['choices'][0]['message']['content'];

    } else {

      throw Exception('Failed to load data: ${response.reasonPhrase}');

    }

  }

}