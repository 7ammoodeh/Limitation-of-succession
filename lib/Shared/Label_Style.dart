import 'package:flutter/material.dart';

final TextStyle labeltext = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontSize: 25,
  fontStyle: FontStyle.italic,
);
final TextStyle numltext = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontSize: 20,
  fontStyle: FontStyle.italic,
);
final TextStyle texttable = TextStyle(
  color: Colors.black,
  fontSize: 20,
);
Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blue;
  }
  return Colors.red;
}

Image appLogo = new Image(
  image: new ExactAssetImage("images/7M.png"),
  height: 88.0,
  width: 80.0,
);
