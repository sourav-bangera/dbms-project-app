import 'package:dbmspr/components/widget.dart';
import 'package:dbmspr/pages/add_question.dart';
import 'package:dbmspr/services/database.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({super.key});

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {

  final _formKey = GlobalKey<FormState>();
  late String quizImageUrl, quizTitle, quizDescription, quizId;
  DatabaseService databaseService = new DatabaseService();

  createQuizOnline() async {
   quizId = randomAlphaNumeric(16);
   if(_formKey.currentState!.validate()){


     quizId = randomAlphaNumeric(16);
     Map<String,String> quizMap = {
         "quizId" : quizId,
         "quizImgUrl" : quizImageUrl,
         "quizTitle" : quizTitle,
         "quizDesc" : quizDescription,

     };
     await databaseService.addQuizData(quizMap, quizId).then((value){
       setState(() {
         Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) =>  AddQuestion(quizId),
          ));
       });
     });
   }

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Create Quiz",style: TextStyle(fontFamily:'HelveticaNowDisplay',fontSize: 18)),
        backgroundColor: Colors.grey.shade900,
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(children: [
            SizedBox(height: 20,),
            TextFormField(
              validator: (val) => (val?.isEmpty ?? true) ? "Enter Image Url" : null,
              decoration: InputDecoration(
                hintText: "Quiz Image Url",
              ),
              onChanged: (val){
              quizImageUrl = val; 
              },
            ),
            SizedBox(height: 20,),
            TextFormField(
              validator: (val) => (val?.isEmpty ?? true) ? "Enter Quiz Title" : null,
              decoration: InputDecoration(
                hintText: "Quiz Title",
              ),
              onChanged: (val){
              quizTitle = val; 
              },
            ),
            SizedBox(height: 20,),
            TextFormField(
              validator: (val) => (val?.isEmpty ?? true) ? "Enter Quiz Description" : null,
              decoration: InputDecoration(
                hintText: "Quiz Description",
              ),
              onChanged: (val){
              quizDescription = val; 
              },
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                createQuizOnline();
              }, child: blackButton(context : context,label : "Create Quiz")),
            SizedBox(height: 20,),
          ],),
        ),
      )
    );
  }
}