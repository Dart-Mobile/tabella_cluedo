import 'package:flutter/material.dart';
import '../table/_cell.dart';

class Tupla {
  String a;
  int b;
  Tupla(this.a, this.b);
}

class ColorPatterns {
  static Color get background => const Color.fromARGB(255, 10, 17, 40);
  static Color get header => const Color.fromARGB(255, 0, 31, 84);
  static Color get internal => const Color.fromARGB(255, 3, 64, 120);
  static Color get text => const Color.fromARGB(255, 254, 252, 251);
  static List<Color> get avatars => [
        const Color.fromARGB(255, 38, 148, 38),
        const Color.fromARGB(255, 199, 199, 9),
        const Color.fromARGB(255, 233, 14, 233),
        const Color.fromARGB(255, 0, 158, 250),
        const Color.fromARGB(255, 131, 29, 131),
        const Color.fromARGB(255, 219, 29, 29)
      ];
}

class Clues {
  static List<String> get who => [
        "Reverendo Green",
        "Colonnello Mustard",
        "Dottoressa Orchid",
        "Contessa Peacock",
        "Professor Plum",
        "Miss Scarlet"
      ];
  static List<String> get what => [
        "Candeliere",
        "Pugnale",
        "Tubo di piombo",
        "Pistola",
        "Corda",
        "Chiave inglese"
      ];
  static List<String> get where => [
        "Sala da ballo",
        "Sala del biliardo",
        "Serra",
        "Sala da Pranzo",
        "Bagno",
        "Cucina",
        "Biblioteca",
        "Salotto",
        "Studio"
      ];
}

class Marker {
  static IconData get clear => Icons.clear;
  static IconData get secureYes => Icons.check_circle_outline_sharp;
  static IconData get probably => Icons.new_releases;
  static IconData get probablyNot => Icons.flag_outlined;
  static IconData get secureNo => Icons.highlight_off;
  static IconData get effectiveClear => const IconData(0x020);
}

IconData symbol = Marker.clear;

Map<String, Color> avatarColors = {
  for (var i = 0; i < Clues.who.length; i++)
    Clues.who[i]: ColorPatterns.avatars[i]
};

List<CustomCell> userRow = [];
