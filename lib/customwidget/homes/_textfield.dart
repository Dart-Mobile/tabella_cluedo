import 'package:flutter/material.dart';
import 'package:tabella_cluedo/customwidget/table/_cell.dart';
import '../enums/_enums.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({Key? key}) : super(key: key);

  Tupla save = Tupla("", 0);

  @override
  _CustomTextField createState() => _CustomTextField();

  CustomCell toCustomCell() => CustomCell(
        head: save.a,
        user: true,
        userChar: Clues.who[save.b],
      );
}

class _CustomTextField extends State<CustomTextField> {
  TextEditingController _controller = TextEditingController();

  double dropdownWidth = 110;

  @override
  Widget build(BuildContext context) {
    _controller.text = widget.save.a;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width:
              ((MediaQuery.of(context).size.width - dropdownWidth) * 85) / 100,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Container(
              margin: const EdgeInsets.all(0.0),
              child: TextField(
                style: Theme.of(context).textTheme.bodyText2,
                controller: _controller,
                maxLength: 6,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle,
                        color: avatarColors[Clues.who[widget.save.b]]),
                    filled: true,
                    fillColor: ColorPatterns.internal),
                onChanged: (val) {
                  widget.save.a = val;
                },
              ),
            ),
          ),
        ),
        SizedBox(
          child: Container(
            margin: EdgeInsets.only(bottom: 23.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(9)),
              color: avatarColors[Clues.who[widget.save.b]],
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  dropdownColor: ColorPatterns.internal,
                  value: Clues.who[widget.save.b],
                  items: Clues.who
                      .map((String val) => DropdownMenuItem<String>(
                          value: val,
                          child: Container(
                            width: dropdownWidth,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              val,
                              style: TextStyle(
                                color: ColorPatterns.text,
                              ),
                            ),
                          )))
                      .toList(),
                  onChanged: (value) => setState(() {
                        widget.save.b = Clues.who.indexOf(value!);
                      })),
            ),
          ),
        )
      ],
    );
  }
}
