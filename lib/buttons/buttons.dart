import 'package:flutter/material.dart';
import 'package:trackin_n_bingein/styling/styling.dart';
import 'package:trackin_n_bingein/screens/splash.dart';
import 'package:trackin_n_bingein/screens/signin.dart';

class Buttons {
  // get started button
  static Widget getStartedButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: ButtonStyling.primaryColor, 
        backgroundColor: ButtonStyling.buttonTextColor,
        padding: const EdgeInsets.symmetric(vertical:15, horizontal: 20),
        textStyle: const TextStyle(fontSize: 18),
        elevation: 3,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Signin(),
          ),
        );
      },
      child: const Text('Get Started'),
    );
  }
}
