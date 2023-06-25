import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unistay/screens/AdminRegisterScreen.dart';
import 'package:unistay/screens/Dashboard.dart';
import 'package:unistay/screens/Profile.dart';
import 'package:unistay/screens/UpdatePasswordScreen.dart';
import 'package:unistay/screens/DocumentScreen.dart';
import 'package:unistay/screens/add_rooms_screen.dart';
import 'package:unistay/screens/RegisterScreen.dart';
import 'package:unistay/screens/admin_dashboard.dart';
import 'package:unistay/screens/forgot_password_screen.dart';
import 'package:unistay/screens/login_as_admin.dart';
import 'package:unistay/screens/verify_screen.dart';
import 'package:unistay/sign_in/sign_in_screen.dart';
import 'package:unistay/splash/splash_screen.dart';
import 'package:unistay/viewmodels/auth_provider_viewmodel.dart';
import 'package:unistay/screens/AddHostel.dart';
import 'firebase_options.dart';

User? currentUser;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  currentUser = FirebaseAuth.instance.currentUser;

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

        title: 'UNISTAY',
        theme: ThemeData(
        ),
        initialRoute: "/loginadmin",

        routes: {
          '/login':(context) => SignInScreen(),
          '/splash':(context) => SplashScreen(),
          "/loginadmin": (context) => const LoginAsAdminScreen(),
          "/register": (context) => const RegisterScreen(),
          "/admin-register": (context) => AdminRegisterScreen(),
          "/verify":(context)=>Verify(),
          "/dashboard": (context) => Dashboard(),
          "/addhostel": (context) => AddHostel(),

          "/addrooms": (context) => AddRoomsScreen(),
          "/admin-dashboard":(context)=>AdminDashboard(),

          "/add-rooms": (context) => AddRoomsScreen(),
          "/profile":(context)=>Profile(),
          "/update_pass":(context)=>UpdatePasswordScreen(),
          "/forgetpassword": (context) => const ForgotPasswordScreen(),
          "/dashboard": (context) => Dashboard(),
          "/documents":(context)=>Document(),


        },
      ),
    );
  }
}
