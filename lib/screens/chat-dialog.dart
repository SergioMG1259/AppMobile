import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/car.dart';

class Chat extends StatefulWidget {
  final VoidCallback onClose;
  final List<Car> cars;
  const Chat({Key? key, required this.onClose, required this.cars}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController _messageController = TextEditingController();
  List<String> _messages = [];

  void _sendMessage(String message) async {
    setState(() {
      _messages.add(message);
    });
    _messageController.clear();

    try {
      final botReply = await _sendMessageToAPI(message);
      _receiveMessage(botReply);
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<String> _sendMessageToAPI(String message) async {
    final apiKey = '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'; // Reemplaza con tu API key
    final endpoint = 'https://api.openai.com/v1/chat/completions';


    if (message.toLowerCase().contains('de la lista de autos')) {
      // Extraer marcas y modelos de la lista de autos
      final carBrands = widget.cars.map((car) => car.brand).toList();
      final carModels = widget.cars.map((car) => car.model).toList();
      final modifiedMessage = message.replaceAll('de la lista de autos', '${carBrands.join(", ")} ${carModels.join(", ")}');
      message=modifiedMessage;
      print(message);
    }

    // URL del endpoint de la API

    final response = await http.post(
      Uri.parse(endpoint),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: '''
    {
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "system", "content": "user"},
        {"role": "user", "content": "$message"}
      ]
    }
    ''',
    );

    if (response.statusCode == 200) {
      final responseBody = response.body;

      // Decodificar la respuesta en UTF-8
      final decodedResponse = utf8.decode(responseBody.runes.toList());

      final parsedResponse = json.decode(decodedResponse);
      final botReply = parsedResponse['choices'][0]['message']['content'];
      return botReply;
    } else {
      throw Exception('Failed to send message to API'+response.statusCode.toString()+response.body);
    }
  }



  void _receiveMessage(String message) {
    setState(() {
      _messages.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Contenido del chat aquí
              Expanded(
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final message = _messages[index];
                    final isBotMessage = index % 2 == 0; // Alternar entre mensajes del usuario y del bot

                    return ListTile(
                      leading: isBotMessage ? Icon(Icons.chat_bubble_outline) : null,
                      title: Container(
                        decoration: BoxDecoration(
                          color: isBotMessage ? Colors.grey.shade200 : Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Text(message),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'Write a message',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        _sendMessage(_messageController.value.text);
                      },
                      child: Text('Send'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 8.0,
            right: 8.0,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                widget.onClose();
              },
            ),
          ),
        ],
      ),
    );
  }
}
