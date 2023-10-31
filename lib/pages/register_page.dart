import 'package:dbmspr/components/my_button.dart';
import 'package:dbmspr/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../helper/helper_function.dart';

class RegisterPage extends StatefulWidget {


  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
    //text controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();

  //login method
  void register() async {
    //loading circle
    showDialog(context: context, 
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
      ),
      );

    //make sure that passwords match
    if (passwordController.text != confirmPwController.text) {
      //pop loading circle
      Navigator.pop(context);

      //show error to user
      displayMessageToUser("Passwords don't match", context);

    }
    else{
          try{
      //create user
      UserCredential? userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      //pop loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop circle
      Navigator.pop(context);

      //display message to user
      displayMessageToUser(e.code, context);
    }
    }

    //try creating the user
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
              "R  E  G  I  S  T  E  R",
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'HelveticaNowDisplay'),
            ),
            
            const SizedBox(height:30),
        
            //username textfield
            MyTextField(
              hintText: "Username", 
              obscureText: false, 
              controller: usernameController,),

            const SizedBox(height:10),

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

            //confirm password textfield
            MyTextField(
              hintText: "Confirm Password", 
              obscureText: true, 
              controller: confirmPwController,),
              
            const SizedBox(height:10),
        
            //forgot password
           /* Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Forgot Password?", 
                style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
              ],
            ),*/
            const SizedBox(height:25),
        
            //signin button
            MyButton(
              text: "Register", 
              onTap: register,
              ),

              const SizedBox(height:20),

        
            //don't have an account, register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(" Login here",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                )
              ],
            ),
        
               ],
              ),
        ),
       
       ) ),
    );
  }
}