import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trackin_n_bingein/screens/profile.dart';
import 'package:trackin_n_bingein/screens/splash.dart';
import 'package:trackin_n_bingein/screens/signin.dart';
import 'package:trackin_n_bingein/screens/signup.dart';
import 'package:trackin_n_bingein/screens/homepage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => const Splash(),
      '/signin': (context) => const Signin(),
      '/signup': (context) => const Signup(),
      '/homepage': (context) => const Homepage(),
      '/profile': (context) => Profile(),
      // '/media': (context) => Media(),
    },
  ));
}