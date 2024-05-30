import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trackin_n_bingein/screens/mediaList.dart';
import 'package:trackin_n_bingein/styling/styling.dart';

class Media extends StatefulWidget {
  const Media({Key? key}) : super(key: key);

  @override
  _MediaState createState() => _MediaState();
}

class MediaCard extends StatelessWidget {
  final String Mediatitle;
  final String imagePath;

  MediaCard({
    required this.Mediatitle,
    required this.imagePath,
  });

   @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MediaList(
              title: Mediatitle,
            )),
        );
      },
      //card configuration
      child: Container(
        height: 100,  
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.transparent,
            width: 0,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.black54, // Black overlay to make text more readable
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Mediatitle,
                style: TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                  color: Colors.white, 
                ),
              ),
              IconButton(
                onPressed: () {
                  // todo: add logic to delete the item
                },
                icon: Icon(Icons.delete),
                color: Colors.white, // Icon color set to white
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MediaState extends State<Media> {
  List<MediaCard> mediaList = [];
  late TextEditingController addController;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    addController = TextEditingController();
  }

  @override
  void dispose() {
    addController.dispose(); // Corrected controller disposal
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFf9b9b7),
        tooltip: 'Increment',
        onPressed: () async {
          final newMedia = await addMedia(context);
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 35.0, right: 15.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        "lib/assets/placeholder_profile.jpg",
                        fit: BoxFit.cover,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    SizedBox(width: 10),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Kzlyr",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Styling.textColor3,
                            ),
                          ),
                          TextSpan(
                            text: ", explore media listings",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Styling.textColor3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "lib/assets/banner1.png",
                        fit: BoxFit.fill,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 25, right: 25),
                        child: Text(
                          "Track what you binge",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Media listings",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Styling.textColor3,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Add logic to sort media
                      },
                      icon: Icon(Icons.sort),
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Column(
                  children: mediaList,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addMedia(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Media'),
        content: TextField(
          controller: addController,
          autofocus: true,
          decoration: InputDecoration(hintText: 'Add media'),
        ),
        actions: [
          TextButton(
            child: Text('SUBMIT'),
            onPressed: () {
              submitMedia(context); 
            },
          )
        ],
      ),
    );
  }

  // submit button for adding a media
  Future<void> submitMedia(BuildContext context) async {

    final mediaName = addController.text;

    try {
      await firestore.collection('media').add({
        'Name': mediaName,
        //'UserId': userId, 
      });

      setState(() {
        // Add the new media card to the list
        mediaList.add(
          MediaCard(
            Mediatitle: mediaName,
            imagePath: "lib/assets/books.jpg",
          ),
        );
      });
      Navigator.of(context).pop();
      addController.clear();
    } catch (e) {
      print('Error adding media: $e');
    }
  }
}