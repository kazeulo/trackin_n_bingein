import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trackin_n_bingein/screens/splash.dart';
import 'package:trackin_n_bingein/screens/signin.dart';
import 'package:trackin_n_bingein/screens/signup.dart';
import 'package:trackin_n_bingein/screens/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => Splash(),
      '/signin': (context) => Signin(),
      '/signup': (context) => Signup(),
      '/homepage': (context) => Homepage(), 
      // '/media': (context) => Media(),
    },
  ));
}