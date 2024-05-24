import 'package:flutter/material.dart';
import 'package:trackin_n_bingein/buttons/buttons.dart';
import 'package:trackin_n_bingein/styling/styling.dart';

class Media extends StatefulWidget {
  const Media({Key? key}) : super(key: key);

  @override
  MediaState createState() => MediaState();
}

class MediaState extends State<Media> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Row(
          // circular placeholder for photo 
        mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                child: const Text(
                  'Kzlyr, Track your media use',
                  style: TextStyle(color: Colors.white),
                ),
                // placeholder photo on the right side 
            Positioned(
            left: 0,
            bottom: 0,
            child: Image.asset(
              "lib/assets/splash.png",
            ),
          ),
              ),  
                ),
          
        ),
        );

        
  }
}
