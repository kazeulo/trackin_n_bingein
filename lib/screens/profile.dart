import 'package:flutter/material.dart';
import 'edit.dart';

void main() {
  runApp(const Profile());
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      routes: {
        '/editProfile': (context) => const EditProfile(),
        '/myStats': (context) => const MyStatsPage(),
        //'/notifications': (context) => const NotificationsPage(),
        //'/settings': (context) => const SettingsPage(),
        //'/about': (context) => const AboutPage(),
        '/logout': (context) => const LogoutConfirmation(),
      },
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text('Profile'),
          centerTitle: true,
        ),
        body: const Center(
          child: ProfileScreen(),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const LogoutConfirmation();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage("https://picsum.photos/80"),
              ),
              const SizedBox(height: 16),
              const Text(
                'Name',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 8),
              const Text(
                'username',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfileOption(
                      text: 'Edit Profile',
                      icon: Icons.edit,
                      route: '/editProfile'),
                  const ProfileOption(
                      text: 'My Stats',
                      icon: Icons.bar_chart,
                      route: '/myStats'),
                  const ProfileOption(
                      text: 'Notifications',
                      icon: Icons.notifications,
                      route: '/notifications'),
                  const ProfileOption(
                      text: 'Settings',
                      icon: Icons.settings,
                      route: '/settings'),
                  const ProfileOption(
                      text: 'About', icon: Icons.info, route: '/about'),
                  ProfileOption(
                    text: 'Logout',
                    icon: Icons.logout,
                    route: '',
                    onTap: () => _showLogoutConfirmation(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final String text;
  final IconData icon;
  final String route;
  final VoidCallback? onTap;

  const ProfileOption(
      {super.key,
      required this.text,
      required this.icon,
      required this.route,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onTap ??
            () {
              Navigator.of(context).pushNamed(route);
            },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 24),
                const SizedBox(width: 10),
                Text(
                  text,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, size: 18),
          ],
        ),
      ),
    );
  }
}

class LogoutConfirmation extends StatelessWidget {
  const LogoutConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Log Out',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Are you sure you want to log out?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Inter',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEBCFCC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/logout');
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFFDFD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'No',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyStatsPage extends StatelessWidget {
  const MyStatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Stats')),
      body: const Center(child: Text('My Stats Page')),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: const Center(child: Text('Notifications Page')),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Center(child: Text('Settings Page')),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: const Center(child: Text('About Page')),
    );
  }
}
