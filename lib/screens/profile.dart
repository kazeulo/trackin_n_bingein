import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final ValueNotifier<bool> _dark = ValueNotifier<bool>(true);
  final ValueNotifier<double> _widthFactor = ValueNotifier<double>(1.0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _dark,
      builder: (context, darkMode, _) {
        return MaterialApp(
          theme: darkMode ? ThemeData.dark() : ThemeData.light(),
          home: Scaffold(
            appBar: AppBar(
              actions: [
                Switch(
                  value: darkMode,
                  onChanged: (value) {
                    _dark.value = value;
                  },
                ),
                ValueListenableBuilder<double>(
                  valueListenable: _widthFactor,
                  builder: (context, widthFactor, _) {
                    return DropdownButton<double>(
                      value: widthFactor,
                      onChanged: (value) {
                        if (value != null) _widthFactor.value = value;
                      },
                      items: [
                        DropdownMenuItem(value: 0.5, child: Text('Size: 50%')),
                        DropdownMenuItem(value: 0.75, child: Text('Size: 75%')),
                        DropdownMenuItem(value: 1.0, child: Text('Size: 100%')),
                      ],
                    );
                  },
                ),
              ],
            ),
            body: Center(
              child: ValueListenableBuilder<double>(
                valueListenable: _widthFactor,
                builder: (context, widthFactor, _) {
                  return Container(
                    width: MediaQuery.of(context).size.width * widthFactor,
                    child: ProfileScreen(),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: 300,
            height: 600,
            color: Colors.white,
            child: Stack(
              children: [
                Positioned(
                  left: 20,
                  top: 20,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage("https://picsum.photos/80"),
                  ),
                ),
                Positioned(
                  left: 120,
                  top: 40,
                  child: Text(
                    'Profile',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  left: 120,
                  top: 80,
                  child: Text(
                    'Name',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Positioned(
                  left: 120,
                  top: 110,
                  child: Text(
                    'username',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileOption(text: 'Edit Profile'),
                      ProfileOption(text: 'My Stats'),
                      ProfileOption(text: 'Notifications'),
                      ProfileOption(text: 'Settings'),
                      ProfileOption(text: 'About'),
                      ProfileOption(text: 'Logout'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileOption extends StatelessWidget {
  final String text;

  ProfileOption({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 18),
          ),
          Icon(Icons.arrow_forward_ios, size: 18),
        ],
      ),
    );
  }
}
