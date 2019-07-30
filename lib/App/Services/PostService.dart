import 'package:http/http.dart' as http;
import 'dart:convert';
int i =0;
class PostService {
  static PostService _instance;

  static PostService getInstance() { 
    if(_instance == null) {
      _instance =PostService();
    }

    return _instance;
  }
  
//Not doing Future<PostModel> because we want to decouple it
  Future<dynamic> getData() async{
    print(i);
    i += 1;
      var obj = await http.get('https://jsonplaceholder.typicode.com/posts/1');
      return json.decode(obj.body); //Returns an object of type dynamic type
  }
}
