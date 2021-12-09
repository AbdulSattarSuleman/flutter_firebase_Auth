import 'package:flutter/material.dart';

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
          onPressed: () {},
        ),
      ),
    );
  }
}
