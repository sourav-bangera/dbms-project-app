import 'package:dbmspr/constants.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.index, required this.questionLength,});

  final int index;
  final int questionLength;
  @override
  Widget build(BuildContext context) {
    if(index==questionLength-1){
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 27, 27, 27),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: const Text(
        'Result',
        textAlign: TextAlign.center,
      ),
    );
    }else{
      return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 27, 27, 27),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: const Text(
        'Next Question',
        textAlign: TextAlign.center,
      ),
    );
    }
  }
}