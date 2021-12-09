import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jawan_pakistan_app/screens/home_screen.dart';
import 'package:jawan_pakistan_app/screens/login_screen.dart';
import 'package:jawan_pakistan_app/screens/signup_screen.dart';
import 'package:jawan_pakistan_app/screens/splash_screen.dart';
import 'package:jawan_pakistan_app/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: StreamBuilder(
        stream: AuthService().firebaseAuth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          }
          return SignupScreen();
        },
      ),
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        SignupScreen.id: (context) => SignupScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
      },
    );
  }
}
