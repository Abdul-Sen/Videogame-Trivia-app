import 'package:html_unescape/html_unescape.dart';

class Trivia
{
    int responseCode;
    List<Result> results;

    Trivia.initalState() : responseCode = 0, results = null;

    Trivia({ this.responseCode, this.results});

    factory Trivia.fromJson(Map<String, dynamic> parsedJson)
    {
        var list = parsedJson['results'] as List;
        // print(list.runtimeType); //returns List<dynamic>
        List<Result> resultList = list.map((i) => Result.fromJson(i)).toList();
        print(resultList[0].question);
        
        return Trivia(
            responseCode: parsedJson['response_code'],
            results: resultList
            );
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
        var unescape = new HtmlUnescape();

        var incorrectAnsList = json['incorrect_answers'];
        List<String> itemList = incorrectAnsList.cast<String>();
        return Result(
        category: json["category"],
        type: json["type"],
        difficulty: json["difficulty"],
        question: unescape.convert(json["question"]),
        correctAnswer: json["correct_answer"],
        incorrectAnswers: itemList
        );
    }
}