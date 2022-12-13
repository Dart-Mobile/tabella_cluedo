import 'package:flutter/material.dart';
import 'customwidget/homes/_home.dart';
import 'customwidget/homes/_homeAddPlayer.dart';

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
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 10, 17, 40),
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 254, 252, 251),
            opacity: 1.0
          ),
          textTheme: const TextTheme(
            bodyText2: TextStyle(
              color: Color.fromARGB(255, 254, 252, 251)
            )
          ),
          /*textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color.fromARGB(255, 254, 252, 251)
          )*/
          inputDecorationTheme: const InputDecorationTheme(
            counterStyle: TextStyle(
              color: Color.fromARGB(255, 254, 252, 251)
            )
          )
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const AddPlayer(),
          '/who':(context) => Home(head: 0),
          '/what':(context) => Home(head: 1),
          '/where':(context) => Home(head: 2)
        },
        );
  }
}
