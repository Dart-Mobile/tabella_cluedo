import 'package:flutter/material.dart';
import 'package:tabella_cluedo/customwidget/enums/_enums.dart';
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
              color: Color.fromARGB(255, 254, 252, 251), opacity: 1.0),
          textTheme: const TextTheme(
              bodyText2: TextStyle(color: Color.fromARGB(255, 254, 252, 251))),
          /*textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color.fromARGB(255, 254, 252, 251)
          )*/
          inputDecorationTheme: const InputDecorationTheme(
              counterStyle:
                  TextStyle(color: Color.fromARGB(255, 254, 252, 251)))),
      debugShowCheckedModeBanner: false,
      routes: {
        // change for clues type
        '/': (context) => const AddPlayer(),
        '/who': (context) => Home(clues: Clues.who),
        '/what': (context) => Home(clues: Clues.what),
        '/where': (context) => Home(clues: Clues.where)
      },
    );
  }
}
