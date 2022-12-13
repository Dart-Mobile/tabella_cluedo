import 'package:flutter/material.dart';
import '../table/_cell.dart';
import '../enums/_enums.dart';
import '_textfield.dart';

class AddPlayer extends StatefulWidget {
  const AddPlayer({Key? key}) : super(key: key);

  @override
  _AddPlayerState createState() => _AddPlayerState();
}

class _AddPlayerState extends State<AddPlayer> {
  List<CustomTextField> cTextFields = [CustomTextField()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ColorPatterns.background,
      appBar: AppBar(
        title: Text("Tabella del Cluedo",
            style: TextStyle(
              color: ColorPatterns.text,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
        backgroundColor: ColorPatterns.header,
      ),
      body: Column(
        children: [
          ...cTextFields,
          OutlinedButton(
              onPressed: cTextFields.length < 6
                  ? () {
                      setState(() {
                        cTextFields.add(CustomTextField());
                      });
                    }
                  : null,
              child: const Icon(Icons.add))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorPatterns.internal,
        onPressed: () {
          setState(() {
            userRow = [
              for (CustomTextField x in cTextFields)
                if (x.save.a != "") x.toCustomCell()
            ];
            Navigator.pushNamed(context, '/who');
          });
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
