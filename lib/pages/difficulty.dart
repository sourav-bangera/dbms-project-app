import 'package:dbmspr/pages/question_pagethree.dart';
import 'package:dbmspr/pages/question_pagethreeh.dart';
import 'package:dbmspr/pages/question_pagetwo.dart';
import 'package:dbmspr/pages/question_pagetwoh.dart';
import 'package:dbmspr/pages/question_pg.dart';
import 'package:dbmspr/pages/question_pgh.dart';
import 'package:flutter/material.dart';

class DifficultyPage extends StatelessWidget {
  const DifficultyPage({super.key, required this.nextpage});

  final String nextpage;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("C H O O S E    D I F F I C U L T Y",style: TextStyle(fontFamily:'HelveticaNowDisplay',fontSize: 15)),
        backgroundColor: Colors.grey.shade900,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              InkWell(
                onTap: () {
                  if(nextpage == 'quiz1'){
                  Navigator.push(context, MaterialPageRoute(builder:(context) => const QuestionPage()));
                  }else if(nextpage=='quiz2'){
                  Navigator.push(context, MaterialPageRoute(builder:(context) => const QuestionPageTwo()));
                  }else if(nextpage=='evs quiz'){
                  Navigator.push(context, MaterialPageRoute(builder:(context) => const QuestionPageThree()));  
                  }
                },
                child: Container(width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 64, 64, 64),
                     borderRadius: BorderRadius.circular(10.0),
                      ),
                       padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: const Text(
                          'E A S Y',
                           style: TextStyle(fontFamily: 'Helvetica',fontSize: 13),
                           textAlign: TextAlign.center,
                           ),
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: () {
                  if(nextpage == 'quiz1'){
                  Navigator.push(context, MaterialPageRoute(builder:(context) => const QuestionPageh()));
                  }else if(nextpage=='quiz2'){
                  Navigator.push(context, MaterialPageRoute(builder:(context) => const QuestionPageTwoh()));
                  }else if(nextpage=='evs quiz'){
                  Navigator.push(context, MaterialPageRoute(builder:(context) => const QuestionPageThreeh()));  
                  }
                },
                child: Container(width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 64, 64, 64),
                     borderRadius: BorderRadius.circular(10.0),
                      ),
                       padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: const Text(
                          'H A R D',
                           style: TextStyle(fontFamily: 'Helvetica',fontSize: 13),
                           textAlign: TextAlign.center,
                           ),
                ),
              ),
              SizedBox(height: 20,),
            ],
          )
        ),),
    );
  }
}