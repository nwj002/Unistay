import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:unistay/screens/AddHostel.dart';
import 'package:unistay/screens/RegisterScreen.dart';
import 'package:unistay/screens/verify_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/register",
      routes: {
        // Uncomment the routes you need
        // "/login": (context) => LoginScreen(),
        "/register": (context) => RegisterScreen(),
        "/verify": (context) => Verify(),
        // "/input": (context) => BurgerMenu(),
        // "/forget-password": (context) => ForgetScreen(),
        // "/dashboard": (context) => DashBoardScreen(),
        "/addhostel": (context) => AddHostel(),
      },
    );
  }
}
