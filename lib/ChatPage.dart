import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: ChatWidget(),
    );
  }
}
class ChatWidget extends StatefulWidget {
  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              MessageBubble(isMe: false, text: 'Hello!'), // Received message
              MessageBubble(isMe: true, text: 'Hi there!'), // Sent message
              MessageBubble(isMe: true, text: 'This is a longer message.'), // Sent message
              MessageBubble(isMe: false, text: 'Short message.'), // Received message
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8.0), // Add desired bottom padding
          child: _buildInputArea(),
        ),
      ],
    );
  }

  Widget _buildInputArea() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0), // Make it circular
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4.0,
            ),
          ],
        ),

        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // Handle attachments
              },
            ),
            Expanded(
              child:TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(12.0), // Adjust the padding as needed
                  suffixIcon: IconButton(
                    icon: Icon(Icons.emoji_emotions),
                    onPressed: () {
                      // Handle emojis
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0), // Make it circular
                    borderSide: BorderSide.none,
                  ),
                ),
              )
            ),
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {
                // Handle camera
              },
            ),
            IconButton(
              icon: Icon(Icons.mic),
              onPressed: () {
                // Handle microphone
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final bool isMe;
  final String text;

  MessageBubble({required this.isMe, required this.text});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isMe ? Colors.grey[300] : Colors.blue;
    final textColor = isMe ? Colors.black : Colors.white;

    // Calculate the width of the message bubble based on the available screen width
    double maxWidth = MediaQuery.of(context).size.width * 0.7;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}
