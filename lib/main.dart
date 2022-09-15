import 'package:flutter/material.dart';
import 'customwidget/homes/home.dart';
import 'customwidget/homes/homeAddPlayer.dart';
import 'customwidget/enums/Enums.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tabella Cluedo', 
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => AddPlayer(),
          '/who':(context) => Home(head: 0),
          '/what':(context) => Home(head: 1),
          '/where':(context) => Home(head: 2)
        },
        );
  }
}
