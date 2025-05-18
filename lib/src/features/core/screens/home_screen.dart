import 'package:flowchat_app/src/features/core/screens/profile/profile_screen.dart';
import 'package:flowchat_app/src/repository/authentication_repository/authentication_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../custom_widget/user_tile.dart';
import '../../chat/chat_services.dart';
import 'chat_page.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // chat and auth services
  final ChatService _chatService = ChatService();

  final AuthenticationRepo _authService = AuthenticationRepo();

  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flow Chat"),
        centerTitle: false,
        backgroundColor: Colors.blue,
        actions: [
          Icon(Icons.camera_alt_rounded),
          SizedBox(width: 8,),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: (){
                Get.to(()=> ProfileScreen());
              },
                child: Icon(LineAwesomeIcons.bars_solid)),
          )],

      ),
      body: _buildUserList(),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: (){
        },
        backgroundColor: Colors.blue,
      ),

      bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            setState(() {
              myIndex = index;
            });
          },
          currentIndex:  myIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.chat,
              ),
              label: "chats",
              backgroundColor: Colors.blue,
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.update,
                ),
                label: "updates",
                backgroundColor: Colors.blue
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.people,
                ),
                label: "communities",
                backgroundColor: Colors.blue
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.call,
                ),
                label: "calls",
                backgroundColor: Colors.blue
            ),

          ]
      ),

    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chatService.getUsersStream(),
        builder: (context, snapshot) {
          // error
          if (snapshot.hasError) {
            return Text("Error");
          }

          // loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading...");
          }

          // return List view
          return ListView(
            children: snapshot.data!.map<Widget>((userData) =>
                _buildUserListItem(userData, context)).toList(),
          );
        }
    );
  }

  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    final email = userData["email"] as String?;
    final currentUserEmail = _authService.getCurrentUser()?.email;

    // Skip if email is null or is the current user's email
    if (email == null || email == currentUserEmail) return SizedBox();

    return ListTile(
      // tileColor: Colors.blue,
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        maxRadius: 21,
      ),
      title: Text(email, style: Theme.of(context).textTheme.bodyLarge,
      ),
      subtitle: Text(' '),
      trailing: Icon(Icons.update),
      onTap: () {
        Get.to(() => ChatPage(
          receiverEmail: email,
          receiverID: userData["uid"] ?? "",
        ));
      },
    );
  }
}

