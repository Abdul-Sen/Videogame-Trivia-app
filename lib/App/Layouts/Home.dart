import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../Scoped_Models/AppModel.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => Scaffold(
              appBar: AppBar(
                title: Text("HOME Appbar"),
                actions: <Widget>[
                  IconButton(icon: Icon(Icons.clear_all),
                  onPressed: () {
                    Navigator.pushNamed(context, '/menu');
                  },
                  )
                  
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  model.getData();
                },
                child: Icon(Icons.autorenew),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: BottomAppBar(color: Colors.yellow, child: Container(height: 50.0,),),
              body: Column(
                children: <Widget>[
                  Text("TESTING......."), //IT WORKS!!!!!
                  Text(model.body)
                ],
              ),
            ));
  }
}

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Trivia HOME Appbar"),
//       ),
//       body: Center(
//           child: Column(
//         children: <Widget>[
//           Text("Counter: "),
//           ScopedModelDescendant<AppModel>(
//             //!new Text('${model.counter}'),
//             builder: (context, child, postModel) {
//               postModel.getData();
//               return Container(
//                 child: Wrap(
//                   children: <Widget>[
//                     Text(postModel.title),
//                     Text(postModel.body),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ],
//       )),
//       floatingActionButton: FloatingActionButton(
//         mini: false,
//         clipBehavior: Clip.none,
//         onPressed: () => {Navigator.pushNamed(context, '/menu')},
//         child: Text("MENU"),
//       ),
//     );
//   }
// }
