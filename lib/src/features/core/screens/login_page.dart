import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../custom_widget/my_button.dart';
import '../../../custom_widget/my_textfield.dart';
import '../../../custom_widget/square_tile.dart';
import '../controllers/login_controller.dart';
import '../controllers/password_controller.dart';
import 'forget_password/forget_password_options/forget_password_model_bottomsheet.dart';

class LoginPage extends StatelessWidget {
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  final controller = Get.put(PasswordController());
  final controller1 = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();


  //Tap to go to register page
    final  VoidCallback? onTap;

  LoginPage({
    super.key,
    this.onTap,
  });

  //login method 
  void login( ) {

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
            Image.asset("assets/logo/chat_logo.png", height: 250, width: 250,),


               //welcome message
              Text("Welcome back, You've been missed!",
              style: TextStyle(
              color :  Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold
              ),),
            const SizedBox(height: 20,),

              // email text filled
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: controller1.email,
              prefixIcon: Icons.person,
            ),


            const SizedBox(height: 20,),

              //password textField
            Obx(()=>
               MyTextField(
                hintText: "password",
                obscureText: controller.obscureText.value,
                controller: controller1.password,
                prefixIcon: Icons.lock,
                suffixIcon: GestureDetector(
                  onTap: (){
                    controller.obscureText.value = !controller.obscureText.value;
                  },
                  child: Icon(controller.obscureText.value ? Icons.visibility_off : Icons.visibility),
                ),
              ),
            ),

            SizedBox(height: 5,),

            Padding(
              padding: const EdgeInsets.only(left: 160.0),
              child: TextButton(
                  onPressed: () {
                    ForgetPasswordScreen.buildShowModalBottomSheet(context);
                  },
                  child: Text("Forgot password?",style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),)),
            ),

            const SizedBox(height: 10,),
              //login button

            MyButton(
              text : "Login".toUpperCase(),
              onpressed: (){


              }
              //   if(_formKey.currentState!.validate()){
              //     // SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
              //     // LoginController.instance.loginUser(controller1.email.text.trim(), controller1.password.text.trim());
              //     // Get.to(()=> OtpScreen());
              //   }
              // },
            ),

            const SizedBox(height: 20,),

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
              Text("Not a member? ",
                style: Theme.of(context).textTheme.bodyMedium,
                ),
              GestureDetector(
                onTap: onTap,
                child: Text("Sign Up", style: TextStyle(
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

