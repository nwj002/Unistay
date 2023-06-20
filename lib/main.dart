import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unistay/screens/AdminRegisterScreen.dart';
import 'package:unistay/screens/add_rooms_screen.dart';
import 'package:unistay/screens/register_screen.dart';
import 'package:unistay/screens/forgot_password_screen.dart';
import 'package:unistay/screens/login_as_admin.dart';
import 'package:unistay/viewmodels/auth_provider_viewmodel.dart';
import 'package:unistay/screens/AddHostel.dart';
import 'firebase_options.dart';

<<<<<<< HEAD
//main okay
=======
//hi
>>>>>>> 0518833a26d208966cda97330f7e3bb2b7290acf
User ? currentUser;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  currentUser =FirebaseAuth.instance.currentUser;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

        ),
        initialRoute: "/register",
        routes: {
          // "/login-as-admin": (context) => const LoginAsAdminScreen(),
          "/register": (context) => const RegisterScreen(),
          "/admin-register": (context) => AdminRegisterScreen(),
          // "/verify":(context)=>Verify(),
          // "/input":(context)=> BurgerMenu(),
          // "/forget-password": (context) => const ForgotPasswordScreen(),
          // "/dashboard": (context) => DashBoardScreen(),
          // "/addhostel": (context) => AddHostel(),
          "/add-rooms": (context) => AddRoomsScreen(),

        },
      ),

    );
  }
}

