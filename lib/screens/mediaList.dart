import 'package:flutter/material.dart';
import 'package:trackin_n_bingein/styling/styling.dart';

class MediaList extends StatefulWidget {
  const MediaList({Key? key}) : super(key: key);

  @override
  _MediaState createState() => _MediaState();
}

class _MediaState extends State<MediaList> {
  late TextEditingController addController;

  @override
  void initState() {
    super.initState();

    addController = TextEditingController();
  }

  @override
  void dispose() {
    addController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFf9b9b7),
        tooltip: 'Increment',
        onPressed: () async{
          final newItem = await addItem(context);

          // to do: if empty or null, showToast saying to enter again
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
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
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: <Widget>[
                MediaCard(
                      imagePath: 'lib/assets/ach.png',
                      title: 'A Certain Hunger',
                      onTap: () {
                        // navigate to details page
                      },
                    ),
                ],
              ),
          ]
        )
      )
    );
  }

  Future<String?> addItem(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('New book'),
        content: TextField(
          controller: addController,
          autofocus: true,
          decoration: InputDecoration(hintText: 'Add book'),
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
    return null;
  }

  // submit button for adding a media
  void submitMedia(BuildContext context) {
    Navigator.of(context).pop(addController.text);
    addController.clear();
  }
}

// custom widget for the cards
class MediaCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const MediaCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 80,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.transparent,
                width: 0,
              ),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

