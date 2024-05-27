import 'package:flutter/material.dart';
import 'package:trackin_n_bingein/buttons/buttons.dart';
import 'package:trackin_n_bingein/styling/styling.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: BackgroundColor.bColor1,
        child: Stack(
          fit: StackFit.expand, 
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              child: Image.asset(
                "lib/assets/splash.png",
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2 -
                  270,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  "lib/assets/logofin.png",
                  width: 80,
                  height: 90,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 250.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Trackin n Bingein',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Styling.textColor3,
                      ),
                    ),
                    SizedBox(height: 1.0),
                    Text(
                      'Track what you binge',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Styling.textColor3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
             bottom: MediaQuery.of(context).size.height / 2 -
                  380,
              left: 0,
              right: 0,
              child: Center(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Buttons.getStartedButton(
                    context), 
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
