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
      ListTile(
        title: Text('(Rule 2) Quiet Hours: \n a. Observe designated quiet hours during which noise levels should be minimized to ensure a conducive environment for studying and resting. \n b. Respect the rights of other residents by refraining from excessive noise and disruptive behavior at all times.'),
      ),

    ],
    ),
    )


    );
  }
}