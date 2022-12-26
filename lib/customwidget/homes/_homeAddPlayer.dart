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
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: deviceWidth(context), minHeight: deviceHeight(context)),
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ...cTextFields,
                cTextFields.length < 6
                    ? OutlinedButton(
                        onPressed: () {
                          setState(() {
                            cTextFields.add(CustomTextField());
                          });
                        },
                        child: const Icon(Icons.add))
                    : const SizedBox(
                        width: 0,
                        height: 0,
                      )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorPatterns.internal,
        onPressed: () {
          setState(() {
            userRow = [
              for (CustomTextField x in cTextFields)
                if (x.save.a != "") x.toCustomCell()
            ];
            whoTable = generateTable(Clues.who);
            whatTable = generateTable(Clues.what);
            whereTable = generateTable(Clues.where);
            Navigator.popAndPushNamed(context, '/who');
            //Navigator.pushNamed(context, '/who');
          });
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
