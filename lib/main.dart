import 'package:dbmspr/auth/auth.dart';
import 'package:dbmspr/firebase_options.dart';
import 'package:dbmspr/models/question_model.dart';
import 'package:dbmspr/pages/login_page.dart';
import 'package:dbmspr/pages/question_pg.dart';
import 'package:dbmspr/theme/dark_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dbmspr/pages/register_page.dart';
import 'package:dbmspr/auth/login_or_register.dart';
import 'package:dbmspr/models/db_connect.dart';


void main() async {
  var db = DBconnect();
  // db.addQuestionthree(
  //   Question(id: '60', title: 'Self feeding organisms are called',
  //   options: {
  //   'Heterotrophs':false,
  //   'Bacteria and fungi':false,
  //   'Autotrophs':true,
  //   'Fungi':false})
  // );
    // db.fetchQuestionthree();


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       // home: const QuestionPage(),
      home: const AuthPage(),
      theme: darkMode,
    );
  }
}