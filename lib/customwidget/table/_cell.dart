import 'package:flutter/material.dart';
import '../enums/_enums.dart';

class CustomCell extends StatefulWidget {
  CustomCell(
      {super.key,
      this.element = Icons.abc,
      this.head = "null",
      required this.user,
      this.userChar = "null"});
  IconData element;
  String head;
  final bool user;
  String userChar;
  int counter = 0;

  @override
  State<CustomCell> createState() => _CustomCellState();
}

class _CustomCellState extends State<CustomCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => setState(() {
            if (widget.element == symbol &&
                widget.element != Marker.effectiveClear &&
                !widget.user) {
              widget.counter++;
            } else {
              widget.counter = 1;
            }
            widget.user
                ? 0
                : symbol == Marker.clear
                    ? widget.element = Marker.effectiveClear
                    : widget.element = symbol;
          })),
      child: Container(
        color: widget.user ? ColorPatterns.header : ColorPatterns.internal,
        height: (deviceHeight(context) - deviceHeight(context, perc: 20)) /
            Clues.where.length,
        alignment: Alignment.center,
        child: widget.user
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  !Clues.who.contains(widget.head) &&
                          !Clues.what.contains(widget.head) &&
                          !Clues.where.contains(widget.head) &&
                          !widget.head.contains("?")
                      ? Icon(
                          Icons.account_circle,
                          color: widget.userChar != "null"
                              ? avatarColors[widget.userChar]
                              : Colors.white,
                        )
                      : const Text(""),
                  Text(
                    widget.head,
                    style: TextStyle(
                        fontStyle:
                            widget.user ? FontStyle.italic : FontStyle.normal),
                  ),
                ],
              )
            : widget.counter > 1 && Marker.effectiveClear != widget.element
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(widget.element),
                      Text('x' + widget.counter.toString()),
                    ],
                  )
                : Icon(widget.element),
        //
      ),
    );
  }
}
