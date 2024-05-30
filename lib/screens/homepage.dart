import 'package:flutter/material.dart';
import 'package:trackin_n_bingein/screens/profile.dart';
import 'package:trackin_n_bingein/screens/statistics.dart';
import 'package:trackin_n_bingein/styling/styling.dart';

// contains widgets and everything in the homepage only
class Homepage extends StatelessWidget {
  final String username;
  final List<String> selectedInterests;
  const Homepage({Key? key, required this.username, required this.selectedInterests}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xFFA7BCC7),
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('lib/assets/logofin.png', height: 50),
                InkWell(
                  onTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Profile()),
                          );
                  },
                  child: ClipOval(
                    child: Image.asset(
                      "lib/assets/placeholder_profile.jpg",
                      fit: BoxFit.cover,
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GreetingSection(username: username),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WeeklyWrapUpSection(),
                SizedBox(height: 20),
                MyListingsSection(selectedInterests: selectedInterests),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GreetingSection extends StatelessWidget {
  final String username; 

  const GreetingSection({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xFFA7BCC7),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi $username!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            'Keep track of your media journey with ease.',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class WeeklyWrapUpSection extends StatelessWidget {  // not finished
  @override 
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Weekly Wrap-up',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Here is the summary of the media you've consumed this week."),
            SizedBox(height: 10),
            Container(
              width: 250, // Set your desired width
              height: 250,
              child: PieChartWidget(),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text('View my statistics'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyListingsSection extends StatelessWidget {  // not finished
  final List<String> selectedInterests;

  const MyListingsSection({required this.selectedInterests});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Listings',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: selectedInterests.map((interest) {
              IconData icon;
              switch (interest) {
                case 'Books':
                  icon = Icons.book;
                  break;
                case 'Podcasts':
                  icon = Icons.podcasts;
                  break;
                case 'Movies':
                  icon = Icons.movie;
                  break;
                case 'Social Media':
                  icon = Icons.group;
                  break;
                case 'Games':
                  icon = Icons.games;
                  break;
                case 'Blogs':
                  icon = Icons.article;
                  break;
                default:
                  icon = Icons.help;
              }
              return ListingItem(icon: icon, label: interest);
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class ListingItem extends StatelessWidget {  // not finished
  final IconData icon;
  final String label;

  const ListingItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            width: 100,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 40, color: Colors.blue),
              ],
            ),
          ),
        ),
        Text(label),
      ],
    );
  }
}
