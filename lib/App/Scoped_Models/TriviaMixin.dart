import 'package:scoped_model/scoped_model.dart';
import 'package:trivia_game/App/Models/Trivia.dart';
import 'package:trivia_game/App/Services/TriviaService.dart';

mixin TriviaMixin on Model {

  TriviaService _ts = TriviaService.getInstance();
  Trivia _trivia = Trivia.initalState();
  bool triviaLoaded = false;


  //Getters & Setters (no setters atm)
  int get responseCode => _trivia.responseCode;
  List<dynamic> get triviaList => _trivia.results;

    void getQuestion() async{
    final jsonResponse = await _ts.getData();
    this._trivia = Trivia.fromJson(jsonResponse);
    this.triviaLoaded = true;
    notifyListeners();
  }
}
