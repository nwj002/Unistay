import 'package:flutter/material.dart';

class Disciplinary extends StatefulWidget {
  const Disciplinary({Key? key}) : super(key: key);

  @override
  State<Disciplinary> createState() => _DisciplinaryState();
}

class _DisciplinaryState extends State<Disciplinary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Disciplinary Act'),
    ),
    body: SingleChildScrollView(
    child: Column(
    children: [
    ListTile(
    title: Text('(Rule 1)  Respect for Others: \n a. Treat fellow residents, staff, and visitors with respect, courtesy, and dignity. \n b. Avoid engaging in any form of harassment, bullying, or discrimination based on race, gender, religion, nationality, or any other characteristic. \n c. Maintain a peaceful and harmonious living environment for all residents. '),
    ),
    ],
    ),
    )


    );
  }
}