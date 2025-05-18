import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flowchat_app/src/custom_widget/my_textfield.dart';
import 'package:flutter/material.dart';
import '../../../repository/authentication_repository/authentication_repo.dart';
import '../../chat/chat_services.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;

  ChatPage({super.key, required this.receiverEmail, required this.receiverID});

  // text controller
  final TextEditingController _messageController = TextEditingController();

  // chat  and auth services
  final ChatService _chatService = ChatService();
  final AuthenticationRepo _authService = AuthenticationRepo();

  // send message
  void sendMessage() async {
    // if there's sth inside the text field
    if (_messageController.text.isNotEmpty) {
      // send text message
      await _chatService.sendMessage(receiverID, _messageController.text);

      // clear text controller
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receiverEmail)),
      body: Column(
        children: [
          // Display all message
          Expanded(child: _buildMessageList()),

          // user input
          _buildUserInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatService.getMessages(receiverID, senderID),
        builder: (context, snapshot){
          // errors
          if(snapshot.hasError){
            return Text("Error");
          }

          // loading...
          if( snapshot.connectionState == ConnectionState.waiting){
            return Text("Loading...");
          }

          // return
          return ListView(
            children: snapshot.data!.docs.map((doc)=> _buildMessageItem(doc)).toList(),
          );

        }
    );
  }

  // build message item
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    final currentUserID = _authService.getCurrentUser()!.uid;
    bool isCurrentUser = data["senderID"] == currentUserID;

    return Row(
      mainAxisAlignment:
      isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          padding: const EdgeInsets.all(10),
          constraints: const BoxConstraints(maxWidth: 250),
          decoration: BoxDecoration(
            color: isCurrentUser ? Colors.blue[100] : Colors.grey[300],
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
              bottomLeft: Radius.circular(isCurrentUser ? 12 : 0),
              bottomRight: Radius.circular(isCurrentUser ? 0 : 12),
            ),
          ),
          child: Text(
            data["message"] ?? "",
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }


  // build message
  Widget _buildUserInput(){
    return Padding(
      padding: const EdgeInsets.only(bottom : 20.0),
      child: Row(
        children: [
          // text field should take up most of the space
          Expanded(

              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: MyTextField(
                  controller: _messageController,
                hintText: "Type a message",
                obscureText: false,
                prefixIcon: Icons.emoji_emotions_outlined
                      ),
              )),

          //send button
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(onPressed: sendMessage, icon: Icon(Icons.send_outlined),))
        ],
      ),
    );
  }
}
