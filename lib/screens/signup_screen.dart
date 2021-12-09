// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:jawan_pakistan_app/screens/login_screen.dart';
import 'package:jawan_pakistan_app/services/auth_service.dart';

import '../style.dart';

class SignupScreen extends StatefulWidget {
  // const SignupScreen({Key? key}) : super(key: key);

  static String id = "/RegisterScreen";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  // loader default false
  bool loader = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width,
                height: 130,
                child: Stack(
                  children: [
                    Positioned(
                      top: 40,
                      left: 20,
                      child: Text(
                        'Sign Up',
                        style: loginHeading,
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: size.width * 0.79,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.deepPurple,
                      ),
                    ),
                    Positioned(
                        top: 30,
                        right: -28,
                        child: Card(
                          elevation: 20,
                          color: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          child: CircleAvatar(
                              radius: 30, backgroundColor: Colors.deepPurple),
                        )),
                  ],
                ),
              ),
              // Text Field
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Colors.deepPurple,
                            )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(
                              Icons.lock_outline_rounded,
                              color: Colors.deepPurple,
                            )),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //Login  Button
              loader
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          elevation: 10,
                          fixedSize: Size(size.width * 0.9, 50)),
                      onPressed: () async {
                        setState(() {
                          loader = true;
                        });
                        if (emailController.text == '' ||
                            passwordController.text == '') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content:
                                  Text("Please Fill the Required Field.")));
                        } else {
                          User? result = await AuthService()
                              .registerUserWithEmailAndPassword(
                                  emailController.text,
                                  passwordController.text,
                                  context);
                          if (result != null) {
                            Navigator.pushNamed(context, LoginScreen.id);
                            print(emailController.text);
                            print(passwordController.text);
                          }
                          emailController.clear();
                          passwordController.clear();
                        }
                        setState(() {
                          loader = false;
                        });
                      },
                      child: Text(
                        'Sign Up',
                        style: loginbutton,
                      )),
              // Google/facebook Authentication
              SizedBox(
                height: 10,
              ),

              Row(children: <Widget>[
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 30.0, right: 20.0),
                      child: Divider(
                        color: Colors.black,
                        height: 36,
                      )),
                ),
                Text(
                  "OR CONNECT WITH",
                  style: connect,
                ),
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 30.0),
                      child: Divider(
                        color: Colors.black,
                        height: 36,
                      )),
                ),
              ]),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SignInButton(
                        Buttons.Google,
                        elevation: 10,
                        text: "Google".toUpperCase(),
                        shape: StadiumBorder(),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SignInButton(
                        Buttons.Facebook,
                        elevation: 10,
                        text: "Facebook".toUpperCase(),
                        shape: StadiumBorder(),
                        onPressed: () {},
                      ),
                    ),
                    // ElevatedButton.icon(
                    //     onPressed: () {},
                    //     icon: Icon(Icons.mail),
                    //     label: Text('Gogle'.toUpperCase())),
                  ],
                ),
              ),
              // sign up
              Container(
                width: size.width,
                height: 150,
                child: Stack(
                  children: [
                    Positioned(
                      top: 60,
                      right: 20,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        // onTap: () => Navigator.pushNamed(context, LoginS)),
                        onTap: () {
                          Navigator.pushNamed(context, LoginScreen.id);
                        },
                        child: Text(
                          'Login',
                          style: loginHeading,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      right: size.width * 0.79,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.deepPurple,
                      ),
                    ),
                    Positioned(
                        top: 40,
                        left: -28,
                        child: Card(
                          elevation: 20,
                          color: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          child: CircleAvatar(
                              radius: 30, backgroundColor: Colors.deepPurple),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
