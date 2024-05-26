import 'package:flutter/material.dart';

class Media extends StatefulWidget {
  const Media({Key? key}) : super(key: key);

  @override
  MediaState createState() => MediaState();
}

class MediaState extends State<Media> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Media"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                child: ClipOval(
                  child: Image.asset(
                    "lib/assets/placeholder_profile.jpg",
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Kzlyr, track your media listings",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
