
import 'package:scoped_model/scoped_model.dart';
import 'package:trivia_game/App/Models/Post.dart';
import 'package:trivia_game/App/Services/PostService.dart';

mixin PostMixin on Model {

  PostService _ps = PostService.getInstance();

  Post _pt = Post.initialState();

  //Getters & Setters (no setters atm)
  int get id => _pt.id;
  int get userId => _pt.userId;
  String get body => _pt.body;
  String get title => _pt.title;

    void getData() async{
    // Map<String, dynamic> result = await ps.getData(); // Map<String, dynamic>
    final jsonResponse = await _ps.getData();
    this._pt = Post.fromJson(jsonResponse);

    //  this._pt.userId = result['userId'];
    //  this._pt.title =result['title'];
    //  this._pt.body= result['body'];
     
     notifyListeners();
  }
}