import 'package:dbmspr/auth/auth.dart';
import 'package:dbmspr/firebase_options.dart';
import 'package:dbmspr/pages/login_page.dart';
import 'package:dbmspr/theme/dark_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dbmspr/pages/register_page.dart';
import 'package:dbmspr/auth/login_or_register.dart';

void main() async {
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
      home: const AuthPage(),
      theme: darkMode,
    );
  }
}