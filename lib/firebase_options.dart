// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBvQWi8Vk78nYJDF6Ewc_eX-jmb3Hk2Q88',
    appId: '1:368161759412:web:04d7144653efb0f73bb7e1',
    messagingSenderId: '368161759412',
    projectId: 'dbmsapp-29349',
    authDomain: 'dbmsapp-29349.firebaseapp.com',
    storageBucket: 'dbmsapp-29349.appspot.com',
    measurementId: 'G-RT1SD8RTRQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBRvErPPwRX-b-ZdFo5wRXysMf3gaA7dHY',
    appId: '1:368161759412:android:a8caab8a466c844f3bb7e1',
    messagingSenderId: '368161759412',
    projectId: 'dbmsapp-29349',
    storageBucket: 'dbmsapp-29349.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCr5cgaEBmg_PTfynTq7RGtATBGMQVzFeY',
    appId: '1:368161759412:ios:7602f7f1c2dbe4963bb7e1',
    messagingSenderId: '368161759412',
    projectId: 'dbmsapp-29349',
    storageBucket: 'dbmsapp-29349.appspot.com',
    iosBundleId: 'com.example.dbmspr',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCr5cgaEBmg_PTfynTq7RGtATBGMQVzFeY',
    appId: '1:368161759412:ios:7b596bccb901d20d3bb7e1',
    messagingSenderId: '368161759412',
    projectId: 'dbmsapp-29349',
    storageBucket: 'dbmsapp-29349.appspot.com',
    iosBundleId: 'com.example.dbmspr.RunnerTests',
  );
}
