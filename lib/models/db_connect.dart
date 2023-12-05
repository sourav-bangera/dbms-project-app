import 'package:http/http.dart' as http;
import 'question_model.dart';
import 'dart:convert';


class DBconnect {

final url = Uri.parse('https://dbmsapp-29349-default-rtdb.asia-southeast1.firebasedatabase.app/questions.json');
final urltwo = Uri.parse('https://dbmsapp-29349-default-rtdb.asia-southeast1.firebasedatabase.app/questions2.json');
final urlthree = Uri.parse('https://dbmsapp-29349-default-rtdb.asia-southeast1.firebasedatabase.app/questions3.json');

Future<void> addQuestion(Question question) async {
  http.post(url, body: json.encode({
    'title': question.title,
    'options': question.options,

  }));
}

Future<void> addQuestiontwo(Question question) async {
  http.post(urltwo, body: json.encode({
    'title': question.title,
    'options': question.options,
  }));
}
 
 
Future<List<Question>> fetchQuestion() async {
  
  return http.get(url).then((response){

  var data = json.decode(response.body) as Map<String, dynamic>;
  List<Question> newQuestions = [];
  data.forEach((key,value){

    var newQuestion = Question(
    id: key,
    title: value['title'],
    options: Map.castFrom(value['options']),
    );

    newQuestions.add(newQuestion);
  });
  return newQuestions;

  });
}

Future<List<Question>> fetchQuestiontwo() async {
  
  return http.get(urltwo).then((response){

  var datatwo = json.decode(response.body) as Map<String, dynamic>;
  List<Question> newQuestionstwo = [];
  datatwo.forEach((key,value){

    var newQuestiontwo = Question(
    id: key,
    title: value['title'],
    options: Map.castFrom(value['options']),
    );

    newQuestionstwo.add(newQuestiontwo);
  });
  print(newQuestionstwo);
  return newQuestionstwo;


  });
}

Future<void> addQuestionthree(Question question) async {
  http.post(urlthree, body: json.encode({
    'title': question.title,
    'options': question.options,
  }));
}


Future<List<Question>> fetchQuestionthree() async {
  
  return http.get(urlthree).then((response){

  var datathree = json.decode(response.body) as Map<String, dynamic>;
  List<Question> newQuestionsthree = [];
  datathree.forEach((key,value){

    var newQuestionthree = Question(
    id: key,
    title: value['title'],
    options: Map.castFrom(value['options']),
    );

    newQuestionsthree.add(newQuestionthree);
  });
  print(newQuestionsthree);
  return newQuestionsthree;


  });
}



}