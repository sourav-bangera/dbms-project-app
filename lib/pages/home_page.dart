import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //logout user
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("H O M E",style: TextStyle(fontFamily:'HelveticaNowDisplay',fontSize: 15)),
        backgroundColor: Colors.grey.shade900,
        centerTitle: true,
        actions: [
          //logout button
          IconButton(onPressed: logout, icon: Icon(Icons.logout),),
        ],
      ),
    );
  }
}