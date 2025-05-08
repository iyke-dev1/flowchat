import 'package:flowchat_app/src/features/core/screens/profile/widget/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../repository/authentication_repository/authentication_repo.dart';
import 'update_user_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(LineAwesomeIcons.angle_left_solid),
        ),
        title: Text("profile screen", style: TextStyle(color: Colors.blue)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Icon(isDark ? LineAwesomeIcons.moon : Icons.sunny),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(
                      image: NetworkImage(
                        "https://i.pinimg.com/736x/eb/76/a4/eb76a46ab920d056b02d203ca95e9a22.jpg",
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.blue.withAlpha(200),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(LineAwesomeIcons.pencil_alt_solid,),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            Text(
              "profile",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),

            Text(
              "SuperAdmin@iykeeze.com",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 20),

            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide.none,
                  shape: StadiumBorder(),
                ),
                onPressed: ()=> Get.to(UpdateProfileScreen()),
                child: Text("Edit Profile"),
              ),
            ),

            SizedBox(height: 20),

            Divider(thickness: 0.2),

            SizedBox(height: 10),

            ProfileMenuWidget(
              title: "Settings",
              onPressed: (){},
              icon: LineAwesomeIcons.cog_solid,
            ),
            ProfileMenuWidget(
              title: "Wallet Details",
              onPressed: (){},
              icon: LineAwesomeIcons.wallet_solid,
            )
            ,ProfileMenuWidget(
              title: "User Management",
              onPressed: (){},
              icon: LineAwesomeIcons.user_check_solid,
            ),
            Divider(thickness: 0.2,),
            SizedBox(height: 10,),
            ProfileMenuWidget(
              title: "Information",
              onPressed: (){},
              icon: LineAwesomeIcons.info_solid,
            ),
            ProfileMenuWidget(
              title: "LogOut",
              textColor: Colors.red,
              endIcon: false,
              onPressed: (){
                AuthenticationRepo.instance.logout();
              },
              icon: LineAwesomeIcons.sign_out_alt_solid,
            ),
          ],
        ),
      ),
    );
  }
}

