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
      ListTile(
        title: Text('(Rule 3)  Guest Policy: \n a. Adhere to the hostels guest policy, which may include limitations on the number of guests allowed, visitation hours, and registration procedures.\n  b. Ensure that your guests comply with the hostels rules and regulations during their visit. '),
      ),
      ListTile(
        title: Text ('(Rule 4) Room Maintenance: \n a. Keep your room clean, tidy, and free from any health or safety hazards. \n b. Report any maintenance issues or damages to the hostel management promptly. '),
      ),
      ListTile(
        title: Text ('(Rule 5) Prohibited Items: \n  a. Do not possess or use any illegal substances, drugs, or weapons within the hostel premises. \n  b. Observe the hostel policies on prohibited items, including but not limited to candles, incense, fireworks, and flammable materials.'),
      ),
      ListTile(
        title: Text ('(Rule 6) Fire Safety: \n  a. Familiarize yourself with the fire safety procedures and emergency exits within the hostel. \n b. Do not tamper with fire alarms, extinguishers, or any fire safety equipment.'),
      ),
      ListTile(
        title: Text ('(Rule 7) Personal Responsibility: \n  a. Assume responsibility for your own actions and their consequences. \n b. Comply with all local laws and regulations while residing in the hostel.'),
      ),

    ],
    ),
    )


    );
  }
}