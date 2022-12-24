import 'package:flutter/material.dart';
import '../table/_table.dart';
import '../table/_dropdown.dart';
import '../enums/_enums.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home({super.key, required this.clues});
  List<String> clues;

  @override
  _HomeState createState() => _HomeState();
}

/*
  widget.head --> enums.dart
              --> from int to Clues type


*/
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Map<String, IconData> pages = <String, IconData>{
      'chi': Icons.person,
      'che cosa': Icons.auto_stories,
      'dove': Icons.map
    };

    List<bool> isSel = [true, false, false, false, false];

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTable(
            clue: widget.clues,
          )
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: ColorPatterns.header),
        child: ToggleButtons(
          renderBorder: false,
          fillColor: ColorPatterns.header,
          isSelected: isSel,
          children: [
            ...[
              for (var entry in pages.entries)
                ButtonTheme(
                  minWidth: 100,
                  height: deviceHeight(context, perc: 10),
                  child: OutlinedButton(
                      //maximumsize
                      onPressed: () {
                        Navigator.popAndPushNamed(
                            context,
                            entry.key == "chi"
                                ? "/who"
                                : entry.key == "che cosa"
                                    ? "/what"
                                    : "/where");
                      },
                      child: Column(
                        children: [Icon(entry.value), Text(entry.key)],
                      )),
                )
            ],
            SizedBox(
              width: deviceWidth(context, perc: 30),
            ),
            const CustomDropDown()
          ],
        ),
      ),
    );
  }
}
