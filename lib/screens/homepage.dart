import 'package:flutter/material.dart';
import 'package:trackin_n_bingein/styling/styling.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    HomeTab(),
    StatisticsTab(),
    ListTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('lib/assets/logofin.png', height: 50),
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 30, color: Colors.white),
            ),
          ],
        ),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _currentIndex == 0 ? Styling.textColor3 : Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics, color: _currentIndex == 1 ? Styling.textColor3 : Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list, color: _currentIndex == 2 ? Styling.textColor3 : Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: _currentIndex == 3 ? Styling.textColor3 : Colors.black),
            label: '',
          ),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GreetingSection(),
            SizedBox(height: 20),
            WeeklyWrapUpSection(),
            SizedBox(height: 20),
            MyListingsSection(),
          ],
        ),
      ),
    );
  }
}

class GreetingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi Kzlyr!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Keep track of your media journey with ease.',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ],
    );
  }
}

class WeeklyWrapUpSection extends StatelessWidget {
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            CircularProgressIndicator(
              value: 0.0,
              strokeWidth: 10,
              backgroundColor: Colors.grey[200],
            ),
            SizedBox(height: 10),
            Text('Some informative text.'),
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

class MyListingsSection extends StatelessWidget {
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
            children: [
              ListingItem(
                icon: Icons.book,
                label: 'Books',
              ),
              ListingItem(
                icon: Icons.podcasts,
                label: 'Podcasts',
              ),
              ListingItem(
                icon: Icons.movie,
                label: 'Movies',
              ),
              // Add more items as needed
            ],
          ),
        ),
      ],
    );
  }
}

class ListingItem extends StatelessWidget {
  final IconData icon;
  final String label;

  ListingItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            SizedBox(height: 10),
            Text(label, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class StatisticsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Statistics',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'List',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
