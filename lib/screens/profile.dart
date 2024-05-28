import 'package:flutter/material.dart';

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
        '/notifications': (context) => const NotificationsPage(),
        '/settings': (context) => const SettingsPage(),
        '/about': (context) => const AboutPage(),
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

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double containerWidth = constraints.maxWidth * 0.9;
        double containerHeight = constraints.maxHeight * 0.9;
        double padding = constraints.maxWidth * 0.05;

        return SingleChildScrollView(
          child: Center(
            child: Container(
              width: containerWidth,
              height: containerHeight,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: containerWidth / 2 - 10,
                    top: 21,
                    child: Container(
                      width: 19,
                      height: 19,
                      decoration: const ShapeDecoration(
                        color: Colors.black,
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: padding,
                    top: padding,
                    child: Container(
                      width: containerWidth - padding * 2,
                      height: containerHeight - padding * 2,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: containerWidth / 2 - 10 - padding,
                            top: 8,
                            child: Container(
                              width: 19,
                              height: 19,
                              decoration: const ShapeDecoration(
                                color: Colors.black,
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                          Positioned(
                            left: padding * 1.2,
                            top: containerHeight * 0.15,
                            child: Container(
                              width: containerWidth * 0.125,
                              height: containerHeight * 0.05,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(),
                            ),
                          ),
                          Positioned(
                            left: padding * 1.2,
                            top: containerHeight * 0.155,
                            child: Container(
                              width: containerWidth * 0.08,
                              height: containerHeight * 0.04,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: containerHeight * 0.85,
                            child: SizedBox(
                              width: containerWidth - padding * 2,
                              height: containerHeight * 0.075,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: containerWidth - padding * 2,
                                      height: containerHeight * 0.075,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFFAEEFF),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            topRight: Radius.circular(30),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: containerWidth / 2 - 10 - padding,
                            top: 8,
                            child: Container(
                              width: 19,
                              height: 19,
                              decoration: const ShapeDecoration(
                                color: Colors.black,
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                          Positioned(
                            left: padding * 1.2,
                            top: containerHeight * 0.15,
                            child: Container(
                              width: containerWidth * 0.125,
                              height: containerHeight * 0.05,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(),
                            ),
                          ),
                          Positioned(
                            left: padding * 1.2,
                            top: containerHeight * 0.155,
                            child: Container(
                              width: containerWidth * 0.08,
                              height: containerHeight * 0.04,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(),
                            ),
                          ),
                          Positioned(
                            left: containerWidth / 2 - 10 - padding,
                            top: 8,
                            child: Container(
                              width: 19,
                              height: 19,
                              decoration: const ShapeDecoration(
                                color: Colors.black,
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                          Positioned(
                            left: containerWidth * 0.3,
                            top: containerHeight * 0.13,
                            child: Container(
                              width: containerWidth * 0.28,
                              height: containerHeight * 0.13,
                              decoration: const ShapeDecoration(
                                color: Color(0xFFAACED0),
                                shape: OvalBorder(
                                  side: BorderSide(width: 1, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: containerWidth * 0.48,
                            top: containerHeight * 0.23,
                            child: Container(
                              width: containerWidth * 0.1,
                              height: containerHeight * 0.05,
                              decoration: const ShapeDecoration(
                                color: Colors.white,
                                shape: OvalBorder(
                                  side: BorderSide(width: 1, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 17,
                            top: 286,
                            child: SizedBox(
                              width: 180,
                              height: 23,
                              child: Text(
                                'Basic Information',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 25,
                            top: 323,
                            child: SizedBox(
                              width: 71,
                              height: 18,
                              child: Text(
                                'Full Name',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 25,
                            top: 415,
                            child: SizedBox(
                              width: 94,
                              height: 18,
                              child: Text(
                                'Date of Birth',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 25,
                            top: 510,
                            child: SizedBox(
                              width: 134,
                              height: 18,
                              child: Text(
                                'Change Password',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: padding,
                            top: containerHeight * 0.35,
                            child: Container(
                              width: containerWidth - padding * 2,
                              height: containerHeight * 0.05,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFFFFDFD),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: padding,
                            top: containerHeight * 0.45,
                            child: Container(
                              width: containerWidth - padding * 2,
                              height: containerHeight * 0.05,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFFFFDFD),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: padding,
                            top: containerHeight * 0.55,
                            child: Container(
                              width: containerWidth - padding * 2,
                              height: containerHeight * 0.05,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFFFFDFD),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 111,
                            top: 45,
                            child: SizedBox(
                              width: 163,
                              height: 45,
                              child: Text(
                                'My Profile',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontFamily: 'Inter',
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: containerWidth * 0.55,
                            top: containerHeight * 0.2,
                            child: Container(
                              width: containerWidth * 0.08,
                              height: containerHeight * 0.05,
                              decoration: const ShapeDecoration(
                                color: Color(0xFFFAEEFF),
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
