import 'package:flutter/material.dart';
import '../enums/Enums.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {

  List<IconData> marker = [
    Marker.clear,
    Marker.secureYes,
    Marker.probably,
    Marker.probablyNot,
    Marker.secureNo
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        color: ColorPatterns.internal,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<IconData>(
          iconSize: 0.0,
          icon: Icon(Marker.effectiveClear),
          dropdownColor: ColorPatterns.header,
          value: symbol,
          onChanged: (value) => setState(() {
            symbol = value!;
          }),
          items: marker.map((IconData e) {
            return DropdownMenuItem<IconData>(
              value: e, 
              child: Icon(e, color: ColorPatterns.text)
            );
          }).toList(),
        ),
      ),
    );
  }
}
