import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:unistay/presentation/route/route.dart';

import 'firebase_options.dart';
import 'logic/provider/complaint_provider.dart';
import 'logic/provider/leave_provider.dart';
import 'logic/provider/service_provider.dart';
import 'logic/provider/user_data_provider.dart';
import 'logic/services/auth_services/auth_service.dart';
import 'logic/services/fireStoreServices/complaint_firestore_service.dart';
import 'logic/services/fireStoreServices/leave_firestore_service.dart';
import 'logic/services/fireStoreServices/service_firestore_service.dart';
import 'logic/services/fireStoreServices/user_firestore_service.dart';

Future<void> main() async {
  int? initScreen;

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  MyApp({Key? key, this.home}) : super(key: key);
  String? home;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider.value(
          value: ServiceFirestoreService().getService(),
          initialData: null,
        ),
        StreamProvider.value(
          value: LeaveFirestoreService().getLeave(),
          initialData: null,
        ),
        StreamProvider.value(
          value: NoticeFirestoreService().getNotice(),
          initialData: null,
        ),
        StreamProvider.value(
          value: ComplaintFirestoreService().getComplaintForAdmin(),
          initialData: null,
        ),
        StreamProvider.value(
          value: UserDataFirestoreService().getUserData(),
          initialData: null,
        ),
        ChangeNotifierProvider.value(
          value: NoticeProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ComplaintProvider(),
        ),
        ChangeNotifierProvider.value(
          value: UsereDataProvider(),
        ),
        ChangeNotifierProvider.value(
          value: LeaveProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ServiceProvider(),
        ),
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
        Provider<UserDataFirestoreService>(
          create: (_) => UserDataFirestoreService(),
        ),
        Provider(create: (_) => OnboardingScreen()),
        Provider(create: (_) => SplashModel())
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.orangeAccent,
          fontFamily: "Brazila",
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (route) => Routes.generateRoute(route, home),
      ),
    );
  }
}
