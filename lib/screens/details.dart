import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String title;

  const Details({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implement the UI for displaying details
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Details Screen'),
      ),
    );
  }
}
