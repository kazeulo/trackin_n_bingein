import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Details extends StatefulWidget {
  final String title;

  const Details({Key? key, required this.title}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late double progressToAdd;
  late double progress; 
  late String catName;
  
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    progressToAdd = 0;
    progress = 0; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Media')
            .where('Name', isEqualTo: widget.title)
            .snapshots()
            .map((snapshot) => snapshot.docs.first),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final mediaData = snapshot.data!;

          // Extract media fields
          final String name = mediaData['Name'];
          final String author = mediaData['Author'];
          final String description = mediaData['Description'];
          final String status = mediaData['Status'];
          progress = mediaData['Progress']; // Assign value to progress
          final double max = mediaData['Max'];
          final String imagePath = mediaData['Image'];
          final String categoryName = mediaData['CategoryName'];
          catName = mediaData['CategoryName'];

          return ListView(
            padding: EdgeInsets.all(16),
            children: [
              // Container(
              //   height: 50, 
              //   width: double.infinity, 
              //   child: Image.network(
              //     imagePath,
              //     fit: BoxFit.cover, 
              //   ),
              // ),
              SizedBox(height: 20),
              Text('Name: $name', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('Author: $author', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('Description: $description', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('Progress: $progress', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('Status: $status', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('Max: $max', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Add to Progress',
                  prefixIcon: Icon(Icons.add),
                ),
                onChanged: (value) {
                  setState(() {
                    progressToAdd = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    progress += progressToAdd;

                    // Update progress in Firestore
                    FirebaseFirestore.instance
                        .collection('Media')
                        .where('Name', isEqualTo: widget.title)
                        .get()
                        .then((querySnapshot) {
                      querySnapshot.docs.forEach((doc) {
                        doc.reference.update({'Progress': progress});
                      });
                    });

                    // update overallstat
                    FirebaseFirestore.instance
                        .collection('Category')
                        .where('Name', isEqualTo: catName) 
                        .get()
                        .then((querySnapshot) {
                      querySnapshot.docs.forEach((doc) {
                        // Retrieve the existing overallStat and add progressToAdd to it
                        final double existingOverallStat = doc['OverallStat'] ?? 0;
                        final double newOverallStat = existingOverallStat + progressToAdd;

                        // Update the overallStat field in Firestore
                        doc.reference.update({'OverallStat': newOverallStat});
                      });
                    });
                    _controller.clear();
                  });
                },
                child: Text('Record Progress'),
              ),
            ],
          );
        },
      ),
    );
  }
}
