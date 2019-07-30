import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../Scoped_Models/AppModel.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => Scaffold(
              appBar: AppBar(
                title: Text("MENU Appbar"),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.clear_all),
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                  )
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  model.getQuestion();
                  print(model.triviaList[0]);
                },
                child: Icon(Icons.autorenew),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: BottomAppBar(
                color: Colors.yellow,
                child: Container(
                  height: 50.0,
                ),
              ),
              body: Column(
                children: <Widget>[
                  Text(model.triviaLoaded
                      ? model.triviaList[0].question
                      : "Loading..."),
                ],
              ),
            ));
  }
}
