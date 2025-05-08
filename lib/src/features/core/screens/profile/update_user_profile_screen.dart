import 'package:flowchat_app/src/features/core/controllers/profile_controller.dart';
import 'package:flowchat_app/src/features/core/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../custom_widget/my_textfield.dart';
import '../../controllers/password_controller.dart';
import '../../controllers/signup_controller.dart';

class UpdateProfileScreen extends StatelessWidget {
  final controller = Get.put(SignUpController());
  final controller1 = Get.put(PasswordController());
  final controller2 = Get.put(ProfileController());
   UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(LineAwesomeIcons.angle_left_solid),
        ),
        title: Text("Edit Profile", style: TextStyle(color: Colors.blue)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Icon(isDark ? LineAwesomeIcons.moon : Icons.sunny),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FutureBuilder(
              future: controller2.getUserData(),
              builder: (context, snapshot){
              if (snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasData){
                final userData = snapshot.data!;

               // text field controllers to get data from the text field
               //  final email = TextEditingController(text: userData.email);
               //  final password = TextEditingController(text: userData.password);
               //  final fullName = TextEditingController(text: userData.fullName);
               //  final phoneNo = TextEditingController(text: userData.phoneNo);

                return Column(
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
                              child: Icon(LineAwesomeIcons.camera_solid,),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 30),

                    // fullName text filled
                    MyTextField(
                      // initialValue: userData.fullName,
                      hintText: "FullName",
                      obscureText: false,
                      // controller: fullName,
                      prefixIcon: Icons.person,
                    ),


                    const SizedBox(height: 10,),



                    // email text filled
                    MyTextField(
                      // initialValue: userData.email,
                      hintText: "Email",
                      obscureText: false,
                      // controller: email,
                      prefixIcon: Icons.email_outlined,
                    ),


                    const SizedBox(height: 10,),



                    // phone number text filled
                    MyTextField(
                      // initialValue: userData.phoneNo,
                      hintText: "Phone No.",
                      obscureText: false,
                      // controller: phoneNo,
                      prefixIcon: Icons.phone,
                    ),


                    const SizedBox(height: 10,),



                    //password textField
                    Obx(()=>
                        MyTextField(
                          // initialValue: userData.password,
                          hintText: "password",
                          obscureText: controller1.obscureText.value,
                          // controller: password,
                          prefixIcon: Icons.lock,
                          suffixIcon: GestureDetector(
                            onTap: (){
                              controller1.obscureText.value = !controller1.obscureText.value;
                            },
                            child: Icon(controller1.obscureText.value ? Icons.visibility_off : Icons.visibility),
                          ),
                        ),
                    ),

                    SizedBox(height: 20),

                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          final userData = UserModel (
                            email: controller.email.text.trim(),
                            password: controller.password.text.trim(),
                            fullName: controller.fullName.text.trim(),
                            phoneNo: controller.phoneNo.text.trim(),
                          );

                          await controller2.updateRecord(userData);
                        },
                        style: ElevatedButton.styleFrom(
                          side: BorderSide.none,
                          shape: StadiumBorder(),
                        ),
                        child: Text("Edit Profile"),
                      ),
                    ),

                    SizedBox(height: 35),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Joined ",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: "1st May 2025",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                )
                              )
                            ]
                          ),
                        ),


                        ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            side: BorderSide.none,
                            elevation: 0,
                            foregroundColor: Colors.red,
                            backgroundColor: Colors.redAccent.withAlpha(100),
                            shape: StadiumBorder(),
                          ),
                          child: Text("Delete"),
                        ),
                      ],
                    ),

                  ],
                );

              } else if (snapshot.hasError){
                 return Center(child: Text(snapshot.error.toString()),);
              } else {
                return Center(child: Text("Something went wrong"),);
              }

              }else {
                return Center(child: CircularProgressIndicator(),);
              }
            },
          ),
        ),
      ),

    );
  }
}

