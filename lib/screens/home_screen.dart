import 'package:flutter/material.dart';
import 'package:jawan_pakistan_app/services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String id = '/homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jawan Pakistan "),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Sign Out"),
          onPressed: () async {
            await AuthService().googleSignOut();
            // Navigator.pushReplacementNamed(context, SignupScreen.id);
          },
        ),
      ),
    );
  }
}
