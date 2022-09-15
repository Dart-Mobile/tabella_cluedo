import 'package:flutter/material.dart';
import '../enums/Enums.dart';
import 'Cell.dart';

class CustomTable extends StatelessWidget {
  CustomTable(
      {super.key,
      required this.title,
      required this.column});
  final String title;
  final List<CustomCell> column;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: Table(
        columnWidths: const <int, TableColumnWidth>{0: FixedColumnWidth(80)},
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            children: [CustomCell(head: title, user: true),...userRow]
          ),
          ...[
            for (var cell in column)
              TableRow(children: [
                cell,
                ...[for (int i = 0; i < userRow.length; i++) 
                CustomCell(element: Marker.effectiveClear, user: false)]
              ])
          ]
        ],
      ),
    );
  }
}
