import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../custom_widget/my_button.dart';
import '../../../custom_widget/my_textfield.dart';
import '../../../custom_widget/square_tile.dart';
import '../controllers/password_controller.dart';
import '../controllers/signup_controller.dart';


class SignUpPage extends StatelessWidget {
  final controller = Get.put(SignUpController());
  final controller1 = Get.put(PasswordController());
  final _formKey = GlobalKey<FormState>();

  //tap to go to login page
  final void Function()? onTap;

  SignUpPage({super.key,
  required this.onTap,
  });

// sign Up method
void signUp(){

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Theme.of(context).colorScheme.surface,
      body:  Center(
      child :SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment : MainAxisAlignment.center,
            children: [

              // logo
            Image.asset("assets/logo/chat_logo.png", height: 200, width: 250,),

               //welcome message
              Text("let's create an account for you.",
              style: TextStyle(
              color :  Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              ),),

            const SizedBox(height: 10,),

              // email text filled
            MyTextField(
              hintText: "FullName",
              obscureText: false,
              controller: controller.fullName,
              prefixIcon: Icons.person,
            ),


            const SizedBox(height: 10,),



              // email text filled
              MyTextField(
                hintText: "Email",
                obscureText: false,
                controller: controller.email,
                prefixIcon: Icons.email_outlined,
              ),


              const SizedBox(height: 10,),



              // email text filled
              MyTextField(
                hintText: "Phone No.",
                obscureText: false,
                controller: controller.phoneNo,
                prefixIcon: Icons.phone,
              ),


              const SizedBox(height: 10,),



              //password textField
            Obx(()=>
               MyTextField(
                hintText: "password",
                obscureText: controller1.obscureText.value,
                controller: controller.password,
                prefixIcon: Icons.lock,
                suffixIcon: GestureDetector(
                  onTap: (){
                    controller1.obscureText.value = !controller1.obscureText.value;
                  },
                  child: Icon(controller1.obscureText.value ? Icons.visibility_off : Icons.visibility),
                ),
              ),
            ),

            const SizedBox(height: 20,),
              //login button

              Obx(() => MyButton(
                isLoading: controller.isLoading.value ? true : false,
                text: "SIGN UP",
                onpressed: controller.isFacebookLoading.value || controller.isGoogleLoading.value || controller.isLoading.value
                    ? null
                    : () {
                  if (_formKey.currentState!.validate()) {
                    // Start loading
                    controller.isLoading.value = true;

                    // Call the sign-up methods
                    SignUpController.instance.registerUser(
                      controller.email.text.trim(),
                      controller.password.text.trim(),
                    );

                    // SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());


                    // final user = UserModel(
                    //   fullName: controller.fullName.text.trim(),
                    //   email: controller.email.text.trim(),
                    //   phoneNo: controller.phoneNo.text.trim(),
                    //   password: controller.password.text.trim(),
                    // );
                    //
                    // SignUpController.instance.createUser(user);

                    // You can end loading or navigate after some async operation
                     Future.delayed(Duration(seconds: 2), () => controller.isLoading.value = false);
                  }
                },
              )),


              SizedBox(height: 20,),
              // google + apple signIn button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[600],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Or continue with",
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),),
                    ),
                    Expanded(
                      child: Divider(
                        thickness:0.5,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),


              SizedBox(height: 20,),
              // google + apple sing in button

              // google
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagepath: "assets/images/google.png"),

                  SizedBox(width: 10,),


                  // apple
                  SquareTile(imagepath: "assets/images/apple.png"),
                ],
              ),


              SizedBox(height: 20,),


              //sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text("Already have an account? ", style: TextStyle(
               fontWeight: FontWeight.w400
              ),
                ),
              GestureDetector(
                onTap: onTap,
                child: Text("Login Now", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
                  ),
                ),
              ),
                ],
              )

            ],),
          ),
        ),
      ),)
    );
  }
}
    
  