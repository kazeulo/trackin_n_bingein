import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final ValueNotifier<bool> _dark = ValueNotifier<bool>(true);
  final ValueNotifier<double> _widthFactor = ValueNotifier<double>(1.0);

  Profile({super.key});

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
                      items: const [
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
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * widthFactor,
                    child: const ProfileScreen(),
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
  const ProfileScreen({super.key});

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
            child: const Stack(
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

  const ProfileOption({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 18),
          ),
          const Icon(Icons.arrow_forward_ios, size: 18),
        ],
      ),
    );
  }
}


class LogoutConfirmation extends StatelessWidget {
  const LogoutConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black.withOpacity(0.5),
        ),
        Positioned(
          left: 1,
          top: 1,
          child: Container(
            width: 389,
            height: 840,
            clipBehavior: Clip.antiAlias,
            decoration: const ShapeDecoration(
              color: Color(0x7F1D1C1C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 25,
                  top: 313,
                  child: Container(
                    width: 339,
                    height: 208,
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
                  left: 57,
                  top: 338,
                  child: SizedBox(
                    width: 89,
                    height: 23,
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 208,
                  top: 447,
                  child: Container(
                    width: 103,
                    height: 42,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFEBCFCC),
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
                  left: 241,
                  top: 457,
                  child: SizedBox(
                    width: 37,
                    height: 23,
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 76,
                  top: 447,
                  child: Container(
                    width: 103,
                    height: 42,
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
                  left: 112,
                  top: 457,
                  child: SizedBox(
                    width: 32,
                    height: 23,
                    child: Text(
                      'No',
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
                  left: 57,
                  top: 376,
                  child: SizedBox(
                    width: 276,
                    height: 18,
                    child: Text(
                      'Are you sure you want to log out?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Inter',
                        height: 0,
                      ),
                    ),
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


class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 430,
          height: 932,
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
                left: 205,
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
                left: 20,
                top: 23,
                child: Container(
                  width: 389,
                  height: 886,
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
                        left: 183,
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
                        left: 47,
                        top: 138,
                        child: Container(
                          width: 54,
                          height: 42,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                        ),
                      ),
                      Positioned(
                        left: 47,
                        top: 143,
                        child: Container(
                          width: 35,
                          height: 33,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 816,
                        child: Container(
                          width: 390,
                          height: 71,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 390,
                                  height: 71,
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
                        left: 183,
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
                        left: 47,
                        top: 138,
                        child: Container(
                          width: 54,
                          height: 42,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                        ),
                      ),
                      Positioned(
                        left: 47,
                        top: 143,
                        child: Container(
                          width: 35,
                          height: 33,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                        ),
                      ),
                      Positioned(
                        left: 183,
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
                        left: 132,
                        top: 118,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFAACED0),
                            shape: OvalBorder(
                              side: BorderSide(width: 1, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 207,
                        top: 198,
                        child: Container(
                          width: 40,
                          height: 40,
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
                        left: 25,
                        top: 356,
                        child: Container(
                          width: 339,
                          height: 42,
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
                        left: 25,
                        top: 445,
                        child: Container(
                          width: 339,
                          height: 42,
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
                        left: 25,
                        top: 537,
                        child: Container(
                          width: 339,
                          height: 42,
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
                        left: 25,
                        top: 537,
                        child: Container(
                          width: 339,
                          height: 42,
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
                        left: 212,
                        top: 203,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://picsum.photos/30/30"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 324,
                        top: 40,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://picsum.photos/40/40"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 17,
                        top: 40,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://picsum.photos/40/40"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 49,
                top: 765,
                child: Container(
                  width: 135,
                  height: 34,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Stack(children: [
                  ,
                  ]),
                ),
              ),
              Positioned(
                left: 20,
                top: 23,
                child: Container(
                  width: 389,
                  height: 886,
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
                        left: 183,
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
                        left: 47,
                        top: 138,
                        child: Container(
                          width: 54,
                          height: 42,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                        ),
                      ),
                      Positioned(
                        left: 47,
                        top: 143,
                        child: Container(
                          width: 35,
                          height: 33,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 816,
                        child: Container(
                          width: 390,
                          height: 71,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 390,
                                  height: 71,
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
                        left: 183,
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
                        left: 47,
                        top: 138,
                        child: Container(
                          width: 54,
                          height: 42,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                        ),
                      ),
                      Positioned(
                        left: 47,
                        top: 143,
                        child: Container(
                          width: 35,
                          height: 33,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                        ),
                      ),
                      Positioned(
                        left: 183,
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
                        left: 132,
                        top: 118,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFAACED0),
                            shape: OvalBorder(
                              side: BorderSide(width: 1, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 207,
                        top: 198,
                        child: Container(
                          width: 40,
                          height: 40,
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
                        left: 24,
                        top: 414,
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
                        left: 25,
                        top: 356,
                        child: Container(
                          width: 339,
                          height: 42,
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
                        left: 25,
                        top: 448,
                        child: Container(
                          width: 339,
                          height: 42,
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
                        left: 212,
                        top: 203,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://picsum.photos/30/30"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 324,
                        top: 40,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://picsum.photos/40/40"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 17,
                        top: 40,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://picsum.photos/40/40"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        top: 538,
                        child: Container(
                          width: 339,
                          height: 42,
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
                        left: 25,
                        top: 504,
                        child: SizedBox(
                          width: 134,
                          height: 18,
                          child: Text(
                            'Confirm Password',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              height: 0,
                            ),
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
      ],
    );
  }
}