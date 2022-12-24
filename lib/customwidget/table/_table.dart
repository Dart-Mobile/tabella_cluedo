import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import '../enums/_enums.dart';
import '_cell.dart';

class CustomTable extends StatefulWidget {
  const CustomTable({super.key, required this.clue});
  final List<String> clue;

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  Function eq = const ListEquality().equals;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: Table(
        border: TableBorder.all(),
        columnWidths: const <int, TableColumnWidth>{0: FixedColumnWidth(80)},
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: eq(widget.clue, Clues.who)
            ? whoTable
            : eq(widget.clue, Clues.what)
                ? whatTable
                : whereTable,
      ),
    );
  }
}
