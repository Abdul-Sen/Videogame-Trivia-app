import 'package:http/http.dart' as http;
import 'dart:convert';

class TriviaService {

  static TriviaService _instance;

  static TriviaService getInstance() { 
    if(_instance == null) {
      _instance =TriviaService();
    }

    return _instance;
  }

//TODO: Fix service
//Not doing Future<PostModel> because we want to decouple it
//There are no "Javascript Objects" in Dart.
  Future<dynamic> getData() async {
      print(StackTrace.current);
      var obj = await http.get('https://opentdb.com/api.php?amount=1&category=15&type=boolean');
      return json.decode(obj.body);
  }
}


class Result
{
    String category;
    String type;
    String difficulty;
    String question;
    String correctAnswer;
    List<String> incorrectAnswers;

    Result({this.category,this.type,this.difficulty,this.question,this.correctAnswer,this.incorrectAnswers,});

    factory Result.fromJson(Map<String, dynamic> json)
    {
        var incorrectAnsList = json['incorrect_answers'];
        List<String> itemList = incorrectAnsList.cast<String>();
        return Result(
        category: json["category"],
        type: json["type"],
        difficulty: json["difficulty"],
        question: json["question"],
        correctAnswer: json["correct_answer"],
        incorrectAnswers: itemList
        );
    }
}

