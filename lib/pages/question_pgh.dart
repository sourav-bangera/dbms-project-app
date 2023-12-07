import 'package:audioplayers/audioplayers.dart';
import 'package:dbmspr/constants.dart';
import 'package:dbmspr/models/db_connect.dart';
import 'package:dbmspr/models/question_model.dart';
import 'package:flutter/material.dart';

import '../widgets(tut)/next_button.dart';
import '../widgets(tut)/option_card.dart';
import '../widgets(tut)/question_widget.dart';
import '../widgets(tut)/result_box.dart';

class QuestionPageh extends StatefulWidget {
  const QuestionPageh({super.key});

  @override
  State<QuestionPageh> createState() => _QuestionPagehState();
}

class _QuestionPagehState extends State<QuestionPageh> {
  
   var db = DBconnect();

 late Future _questions;


 Future<List<Question>> getData()async{
   return db.fetchQuestion();
 }

  @override
  void initState() {
    _questions = getData();
    super.initState();
  }



//  List<Question> _questions = [
//   Question(id: '1',
//   title: "What is 2 + 2 ?",
//   options: {'4':false,'3':false,'10':false,'1':true},
//   ),
//   Question(id: '2',
//   title: "Swaroop ?",
//   options: {'Rao':false,'Gaonkar':false,'Shetty':false,'Hande':true},
//   ),

// ];

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
              onTap: () { 
                return checkAnswerAndUpdate(extractedData[index].options.values.toList()[i]);
                },
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