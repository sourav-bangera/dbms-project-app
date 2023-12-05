import 'package:dbmspr/constants.dart';
import 'package:flutter/material.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({super.key,required this.result, 
  required this.questionLength,required this.onPressed
  });

  final int result;
  final int questionLength;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Result',
          style: TextStyle(color: neutral, fontSize: 22.0,fontFamily: 'Helvetica'),
          ),
          const SizedBox(height: 20.0),
          CircleAvatar(child: Text('$result/$questionLength',style: TextStyle(fontSize: 19,fontFamily: 'Helvetica'),),
          radius: 50.0,
          backgroundColor: result == questionLength/2?Colors.yellow:result < questionLength/2 ? incorrect : correct, 
          ),
          const SizedBox(height: 20),
          Text(result == questionLength/2?'Almost there':result < questionLength/2 ? 'Try Again' : 'Great',style: 
          const TextStyle(color: neutral,fontFamily: 'Helvetica',fontSize: 20),),
          const SizedBox(height: 55.0,),
          GestureDetector(onTap: onPressed,
          child: const Text('Start Over',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),
          fontFamily: 'Helvetica',
          fontSize: 20,
          letterSpacing: 1.0),)
          ,)
        ]),),
    );
  }
}