import 'package:flutter/material.dart';

Widget blackButton({required BuildContext context, required String label, buttonWidth}){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 18),
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(30)
    ),
    alignment: Alignment.center,
    width: buttonWidth ?? MediaQuery.of(context).size.width - 48,
    child: Text(label,style: TextStyle(color: Colors.white))
  );
}