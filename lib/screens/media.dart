import 'package:flutter/material.dart';
import 'package:trackin_n_bingein/styling/styling.dart';

class Media extends StatefulWidget {
  const Media({Key? key}) : super(key: key);

  @override
  _MediaState createState() => _MediaState();
}

class _MediaState extends State<Media> {
  late TextEditingController addController;

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
        onPressed: () async{
          final newMedia = await addMedia(context);

          // to do: if empty or null, showToast saying to enter again
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 25.0, right: 15.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                        text: ", track your media consumption",
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
            SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: const <Widget>[
                MediaCard(name: 'Books', image: 'lib/assets/books.png'),
                MediaCard(name: 'Music', image: 'lib/assets/music.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> addMedia(BuildContext context) async {
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
              submitMedia(context); // Pass context to submit function
            },
          )
        ],
      ),
    );
    return null;
  }

  // submit button for adding a media
  void submitMedia(BuildContext context) {
    Navigator.of(context).pop(addController.text);
    addController.clear();
  }
}

class MediaCard extends StatelessWidget {
  final String name;
  final String image;

  const MediaCard({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.teal[100],
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.transparent,
          width: 0,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: Image.asset(
              image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
