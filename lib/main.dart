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
// db.addQuestionhardtwo(
//     Question(id: '70', title: 'What is the Drake Equation used for in the field of astrophysics?',
//     options: {
//         'Calculating the probability of intelligent extraterrestrial life':true,
//         'Predicting the trajectory of comets':false,
//         'Estimating the age of galaxies':false,
//         'Determining the mass of black holes':false})
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