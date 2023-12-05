import 'package:dbmspr/components/widget.dart';
import 'package:dbmspr/services/database.dart';
import 'package:flutter/material.dart';

class AddQuestion extends StatefulWidget {
  final String quizId;
  AddQuestion(this.quizId);

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {

  late String question, option1, option2, option3, option4;
  final _formKey = GlobalKey<FormState>();

  DatabaseService databaseService = new DatabaseService();


  uploadQuestionData() async {
    if(_formKey.currentState!.validate()){
      print("Validation passed");

      Map<String,String> questionMap = {
        "question" : question,
        "option1" : option1,
        "option2" : option2,
        "option3" : option3,
        "option4" : option4
      };

      await databaseService.addQuestionData(questionMap, widget.quizId).then((value){
      });
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Add Q&As", style: TextStyle(fontFamily: 'HelveticaNowDisplay', fontSize: 18)),
      backgroundColor: Colors.grey.shade900,
      centerTitle: true,
    ),
    body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            TextFormField(
              validator: (val) => (val?.isEmpty ?? true) ? "Enter Question" : null,
              decoration: InputDecoration(
                hintText: "Question",
              ),
              onChanged: (val) {
                question = val;
              },
            ),
            SizedBox(height: 20,),
            TextFormField(
              validator: (val) => (val?.isEmpty ?? true) ? "Enter Option 1" : null,
              decoration: InputDecoration(
                hintText: "Option 1 (Correct Answer)",
              ),
              onChanged: (val) {
                option1 = val;
              },
            ),
            SizedBox(height: 20,),
            TextFormField(
              validator: (val) => (val?.isEmpty ?? true) ? "Enter Option 2" : null,
              decoration: InputDecoration(
                hintText: "Option 2",
              ),
              onChanged: (val) {
                option2 = val;
              },
            ),
            SizedBox(height: 20,),
            TextFormField(
              validator: (val) => (val?.isEmpty ?? true) ? "Enter Option 3" : null,
              decoration: InputDecoration(
                hintText: "Option 3",
              ),
              onChanged: (val) {
                option3 = val;
              },
            ),
            SizedBox(height: 20,),
            TextFormField(
              validator: (val) => (val?.isEmpty ?? true) ? "Enter Option 4" : null,
              decoration: InputDecoration(
                hintText: "Option 4",
              ),
              onChanged: (val) {
                option4 = val;
              },
            ),
            SizedBox(height: 240,),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: blackButton(context: context, label: "Submit", buttonWidth: MediaQuery.of(context).size.width / 2 - 36)),
                SizedBox(width: 24,),
                GestureDetector(
                  onTap: (){
                    print("Button pressed");
                    uploadQuestionData();
                  },
                  child: blackButton(context: context, label: "Add Question", buttonWidth: MediaQuery.of(context).size.width / 2 - 36)),
              ],
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    ),
  );
}
}