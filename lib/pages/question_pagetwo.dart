import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:dbmspr/constants.dart';
import 'package:dbmspr/models/question_model.dart';
import 'package:dbmspr/widgets(tut)/next_button.dart';
import 'package:dbmspr/widgets(tut)/option_card.dart';
import 'package:dbmspr/widgets(tut)/question_widget.dart';
import 'package:dbmspr/widgets(tut)/result_box.dart';

import 'package:dbmspr/models/db_connect.dart';

class QuestionPageTwo extends StatefulWidget {
  const QuestionPageTwo({super.key});


  @override
  State<QuestionPageTwo> createState() => _QuestionPageTwoState();
}

class _QuestionPageTwoState extends State<QuestionPageTwo> {

  var db = DBconnect();

 late Future _questions;


 Future<List<Question>> getData()async{
   return db.fetchQuestiontwo();
 }

  @override
  void initState() {
    _questions = getData();
    super.initState();
  }

  int index=0;
  int score=0;
  bool isPressed = false;
  bool isAlreadySelected = false;

  void nextQuestion(int questionLength) {
    if (index == questionLength -1){
      showDialog(context: context, 
      barrierDismissible: false,
      builder: (ctx)=> ResultBox(result: score, 
      questionLength: questionLength,
      onPressed: startOver ,));
    } else {
      if (isPressed){
    setState(() {
      index++;
      isPressed = false;
      isAlreadySelected = false;
    });
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please Select any option'),behavior: 
        SnackBarBehavior.floating,margin: EdgeInsets.symmetric(vertical: 20.0),));
    }
  }
  }
  
  void checkAnswerAndUpdate(bool value){
    if(isAlreadySelected){
      return;
    }else{
      if(value == true){
      score++;
      }
      setState(() {
      isPressed = true;
      isAlreadySelected = true;
    });   
  }
  }

//function to start over (remember to put this in actual home page)
  void startOver(){
    setState(() {
      index = 0;
      score = 0;
      isPressed=false;
      isAlreadySelected=false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
        return FutureBuilder(
      future: _questions as Future<List<Question>>,
      builder: (ctx, AsyncSnapshot) {
      if(AsyncSnapshot.connectionState == ConnectionState.done){
        if(AsyncSnapshot.hasError){
          return Center(child: Text('error'),
          );
        }else if(AsyncSnapshot.hasData){
          var extractedData = AsyncSnapshot.data as List<Question>;
          return Scaffold(
        appBar: AppBar(
          title: const Text("",style: TextStyle(fontFamily:'Helvetica'),),
          actions: [
            Padding(padding: const EdgeInsets.all(18.0), 
            child: Text('Score: $score',
            style: const TextStyle(fontSize: 16.0, fontFamily: 'Helvetica'),),),
          ],
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
          child: Column(children: [
            QuestionWidget(question: extractedData[index].title, 
            indexAction: index,
            totalQuestions: extractedData.length),
            const Divider(color:neutral),
            const SizedBox(height: 25.0,),
            for(int i =0;i<extractedData[index].options.length;i++)
             GestureDetector(
              onTap: () => checkAnswerAndUpdate(extractedData[index].options.values.toList()[i]),
               child: OptionCard(option: extractedData[index].options.keys.toList()[i],
               color: isPressed 
               ? extractedData[index].options.values.toList()[i] == true 
                  ? correct
                  : incorrect 
               : neutral,
               ),
             ),
          ],)
        ),
        floatingActionButton: GestureDetector(
          onTap: () { 
            if(index==extractedData.length-1){
              AudioPlayer().play(AssetSource('audio/thank_you.mp3'));
            }
            else{
            AudioPlayer().play(AssetSource('audio/button_click.mp3'));
            }
            nextQuestion(extractedData.length);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: NextButton(index: index,questionLength: extractedData.length),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat ,
       );
        }
       }
       else{
        return const Center(child: CircularProgressIndicator(),
        );
      }

       return const Center(
        child: Text('No Data'),
        );
    },
    );
  }
}