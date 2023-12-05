import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbmspr/pages/create_quiz.dart';
import 'package:dbmspr/pages/question_pagethree.dart';
import 'package:dbmspr/pages/question_pagetwo.dart';
import 'package:dbmspr/pages/question_pg.dart';
import 'package:dbmspr/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) => QuestionPage()));
                },
                child: Container(width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 64, 64, 64),
                     borderRadius: BorderRadius.circular(10.0),
                      ),
                       padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: const Text(
                          'Q U I Z  1',
                           style: TextStyle(fontFamily: 'Helvetica',fontSize: 13),
                           textAlign: TextAlign.center,
                           ),
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) => QuestionPageTwo()));
                },
                child: Container(width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 64, 64, 64),
                     borderRadius: BorderRadius.circular(10.0),
                      ),
                       padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: const Text(
                          'Q U I Z  2',
                           style: TextStyle(fontFamily: 'Helvetica',fontSize: 13),
                           textAlign: TextAlign.center,
                           ),
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) => QuestionPageThree()));
                },
                child: Container(width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 64, 64, 64),
                     borderRadius: BorderRadius.circular(10.0),
                      ),
                       padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: const Text(
                          'E V S  Q U I Z',
                           style: TextStyle(fontFamily: 'Helvetica',fontSize: 13),
                           textAlign: TextAlign.center,
                           ),
                ),
              ),

            ],
          )
        ),),
    );
  }
}
