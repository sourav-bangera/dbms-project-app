import 'package:dbmspr/components/my_button.dart';
import 'package:dbmspr/components/my_textfield.dart';
import 'package:dbmspr/helper/helper_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    //text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login method
  void login() async{
    //show loading circle
   showDialog(context: context, builder: (context) => const Center(
    child: CircularProgressIndicator(),
   ), 
   );

   try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);

    if (context.mounted) Navigator.pop(context);
   }

   //display errors
   on FirebaseAuthException catch (e) {
    Navigator.pop(context);
    displayMessageToUser(e.code,context);
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
              //logo
               Icon(
               Icons.person,
               size: 80,
               color: Theme.of(context).colorScheme.inversePrimary,
            ),
        
            const SizedBox(height:25),
         
            //app name
            Text(
              "W  E  L  C  O  M  E",
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'HelveticaNowDisplay'),
            ),
            
            const SizedBox(height:30),
        
            //email textfield
            MyTextField(
              hintText: "Email", 
              obscureText: false, 
              controller: emailController,),

            const SizedBox(height:10),

            //password textfield
            MyTextField(
              hintText: "Password", 
              obscureText: true, 
              controller: passwordController,),
              
            const SizedBox(height:10),
        
            //forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Forgot Password?", 
                style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
              ],
            ),
            const SizedBox(height:25),
        
            //signin button
            MyButton(
              text: "Login", 
              onTap: login,
              ),

              const SizedBox(height:20),

        
            //don't have an account, register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?",style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(" Register here",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                )
              ],
            ),
        
               ],
              ),
       ) ),),
    );
  }
}