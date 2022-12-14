// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movierecommend/Home.dart';
import 'package:movierecommend/Login.dart';
import 'package:movierecommend/SignUp.dart';
import 'package:movierecommend/WelcomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(brightness: Brightness.light, primaryColor: Colors.green),
    home: WelcomeScreen(),
    routes: {
      'S1': (context) => WelcomeScreen(),
      'S2': (context) => Login(),
      'S3': (context) => SignUp(),
      'S4': (context) => Home()
    },
  ));
}
