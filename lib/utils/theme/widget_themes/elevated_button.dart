import 'package:flutter/material.dart';

class TElevatedButton {
  static ButtonStyle lightElevatedBtn = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 20, color: Colors.brown),
  );

  static ButtonStyle darkElevatedBtn = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20, color: Colors.redAccent),
      backgroundColor: const Color.fromARGB(255, 11, 3, 3));
}
