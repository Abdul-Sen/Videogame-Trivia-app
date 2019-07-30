
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import './Scoped_Models/AppModel.dart';

//Layouts
import 'Layouts/Home.dart';
import 'Layouts/Menu.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    var app = MaterialApp(
      theme: ThemeData(
      primarySwatch: Colors.amber,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context)=> Home(),
        '/menu': (context) => Menu()
        },
    );

    return ScopedModel<AppModel>(model: AppModel(), child: app,);
  }
  }