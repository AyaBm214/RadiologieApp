import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showEtatDialog(BuildContext context) {
  // set up the list options
  Widget optionOne = SimpleDialogOption(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const <Widget>[
        Icon(
          Icons.border_all,
          color: Colors.blue,
          size: 36.0,
        ),
        Text(
          "Tous",
          style: TextStyle(fontSize: 20),
        ),
      ],
    ),
    onPressed: () {
      print("Tous");
      Navigator.of(context).pop();
    },
  );
  Divider();
  Widget optionTwo = SimpleDialogOption(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const <Widget>[
        Icon(
          Icons.alarm_on_rounded,
          color: Colors.blue,
          size: 36.0,
        ),
        Text(
          "En Attente",
          style: TextStyle(fontSize: 20),
        ),
      ],
    ),
    onPressed: () {
      print("En Attente");
      Navigator.of(context).pop();
    },
  );
  Divider();
  Widget optionThree = SimpleDialogOption(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const <Widget>[
        Icon(
          Icons.door_back_door,
          color: Colors.blue,
          size: 36.0,
        ),
        Text(
          "En Salle",
          style: TextStyle(fontSize: 20),
        ),
      ],
    ),
    onPressed: () {
      print("En Salle");
      Navigator.of(context).pop();
    },
  );
  Divider();

  Widget optionFour = SimpleDialogOption(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const <Widget>[
        Icon(
          Icons.login_outlined,
          color: Colors.blue,
          size: 36.0,
        ),
        Text(
          "Terminé",
          style: TextStyle(fontSize: 20),
        ),
      ],
    ),
    onPressed: () {
      print("Terminé");
      Navigator.of(context).pop();
    },
  );
  Divider();

  Widget optionFive = SimpleDialogOption(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const <Widget>[
        Icon(
          Icons.mic,
          color: Colors.blue,
          size: 36.0,
        ),
        Text(
          "Dicté",
          style: TextStyle(fontSize: 20),
        ),
      ],
    ),
    onPressed: () {
      print("Dicté");
      Navigator.of(context).pop();
    },
  );
  Divider();

  Widget optionSix = SimpleDialogOption(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const <Widget>[
        Icon(
          Icons.edit,
          color: Colors.greenAccent,
          size: 36.0,
        ),
        Text(
          "Ecrit",
          style: TextStyle(fontSize: 20),
        ),
      ],
    ),
    onPressed: () {
      print("Ecrit");
      Navigator.of(context).pop();
    },
  );
  Divider();

  Widget optionSeven = SimpleDialogOption(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const <Widget>[
        Icon(
          Icons.verified_rounded,
          color: Colors.greenAccent,
          size: 36.0,
        ),
        Text(
          "Validé",
          style: TextStyle(fontSize: 20),
        ),
      ],
    ),
    onPressed: () {
      print("Validé");
      Navigator.of(context).pop();
    },
  );
  Divider();

  Widget optionEight = SimpleDialogOption(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const <Widget>[
        Icon(
          Icons.done_all,
          color: Colors.greenAccent,
          size: 36.0,
        ),
        Text(
          "Livré",
          style: TextStyle(fontSize: 20),
        ),
      ],
    ),
    onPressed: () {
      print("Livré");
      Navigator.of(context).pop();
    },
  );

  // set up the SimpleDialog
  SimpleDialog dialog = SimpleDialog(
    children: <Widget>[
      optionOne,
      optionTwo,
      optionThree,
      optionFour,
      optionFive,
      optionSix,
      optionSeven,
      optionEight,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return dialog;
    },
  );
}
