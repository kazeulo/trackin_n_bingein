import 'package:flutter/material.dart';
import 'package:trackin_n_bingein/styling/styling.dart';
import 'package:trackin_n_bingein/screens/navigation.dart';
import 'package:trackin_n_bingein/screens/signin.dart';

class Buttons {
  // Get Started button
  static Widget getStartedButton(BuildContext context) {
    return ElevatedButton(
      child: const Text('Get Started'),
      style: ElevatedButton.styleFrom(
        foregroundColor: ButtonStyling.primaryColor, 
        backgroundColor: ButtonStyling.buttonTextColor,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        textStyle: TextStyle(fontSize: 18),
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
    );
  }

  // Continue button
  static Widget continueButton(BuildContext context, List<String> selectedInterests) {
    return ElevatedButton(
      child: const Text('Continue'),
      style: ElevatedButton.styleFrom(
        foregroundColor: ButtonStyling.primaryColor,
        backgroundColor: ButtonStyling.buttonTextColor,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        textStyle: TextStyle(fontSize: 18),
        elevation: 3,
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Navigation(selectedInterests: selectedInterests, username: '',),
          ),
        );
      },
    );
  }
}
