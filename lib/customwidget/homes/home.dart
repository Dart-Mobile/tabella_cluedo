import 'package:flutter/material.dart';
import '../table/Table.dart';
import '../table/Cell.dart';
import '../table/DropDown.dart';
import '../enums/Enums.dart';

class Home extends StatefulWidget {
  Home({super.key, required this.head});
  int head;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<String> clues = widget.head % 3 == 0
        ? Clues.who
        : widget.head % 3 == 1
            ? Clues.what
            : Clues.where;

    String heading = widget.head % 3 == 0
        ? "Chi?"
        : widget.head % 3 == 1
            ? "Che Cosa?"
            : "Dove?";

    List<CustomCell> column = [
      for (String i in clues) CustomCell(head: i, user: true)
    ];

    Map<String, IconData> pages = <String, IconData>{
      'chi': Icons.person,
      'che cosa': Icons.auto_stories,
      'dove': Icons.map
    };

    List<bool> isSel = [true, false, false, false, false];

    return Scaffold(
      backgroundColor: ColorPatterns.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTable(title: heading, column: column),
        ],
      ),
      bottomNavigationBar: ToggleButtons(
        isSelected: isSel,
        children: [
          ...[
            for (var entry in pages.entries)
              OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context,
                        entry.key == "chi"
                            ? "/who"
                            : entry.key == "che cosa"
                                ? "/what"
                                : "/where");
                  },
                  child: Column(
                    children: [Icon(entry.value), Text(entry.key)],
                  ))
          ],
          const Spacer(),
          const CustomDropDown()
        ],
      ),
    );
  }
}
