import 'package:flutter/material.dart';

class ChatInputBar extends StatelessWidget {
  final Function(String) onSendMessage;

  const ChatInputBar({required this.onSendMessage});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'أدخل رسالتك',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              if (textController.text.isNotEmpty) {
                onSendMessage(textController.text);
                textController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
