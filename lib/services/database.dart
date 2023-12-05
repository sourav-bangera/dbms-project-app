import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class DatabaseService{

  Future<void> addQuizData(Map<String, dynamic> quizData, String quizId) async{
    await FirebaseFirestore.instance.collection("Quiz").doc(quizId).set(quizData).catchError((e){
      print(e.toString());

    });
  }
  
Future<void> addQuestionData(Map<String, dynamic> questionData, String quizId) async {
  try {
    await FirebaseFirestore.instance.collection("Quiz").doc(quizId).collection("QNA").add(questionData);
    print("Question added successfully");
  } catch (e) {
    print("Error adding question: $e");
  }
}

Future<QuerySnapshot<Map<String, dynamic>>> getQuizData() async {
  return await FirebaseFirestore.instance.collection("Quiz").get();
}




}

