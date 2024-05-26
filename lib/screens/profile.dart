import 'package:flutter/material.dart';

void main() {
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  final ValueNotifier<bool> _dark = ValueNotifier<bool>(true);
  final ValueNotifier<double> _widthFactor = ValueNotifier<double>(1.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ValueListenableBuilder<bool>(
            valueListenable: _dark,
            builder: (context, color, child) {
              return ValueListenableBuilder<double>(
                valueListenable: _widthFactor,
                builder: (context, factor, child) {
                  return Scaffold(
                      backgroundColor:
                          _dark.value ? Colors.black : Colors.white,
                      appBar: AppBar(
                        actions: [
                          Switch(
                            value: _dark.value,
                            onChanged: (value) {
                              _dark.value = value;
                            },
                          ),
                          DropdownButton<double>(
                            value: _widthFactor.value,
                            onChanged: (value) {
                              _widthFactor.value = value!;
                            },
                            items: [
                              DropdownMenuItem<double>(
                                value: 0.5,
                                child: Text('Size: 50%'),
                              ),
                              DropdownMenuItem<double>(
                                value: 0.75,
                                child: Text('Size: 75%'),
                              ),
                              DropdownMenuItem<double>(
                                value: 1.0,
                                child: Text('Size: 100%'),
                              ),
                            ],
                          ),
                        ],
                      ),
                      body: Center(
                          child: Container(
                        width: MediaQuery.of(context).size.width *
                            _widthFactor.value,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Media(),
                          ],
                        ),
                      )));
                },
              );
            }));
  }
}

class Media extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                  decoration: ShapeDecoration(
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
                  decoration: BoxDecoration(),
                ),
              ),
              Positioned(
                left: 47,
                top: 143,
                child: Container(
                  width: 35,
                  height: 33,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
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
                          decoration: ShapeDecoration(
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
                  decoration: ShapeDecoration(
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
                  decoration: BoxDecoration(),
                ),
              ),
              Positioned(
                left: 47,
                top: 143,
                child: Container(
                  width: 35,
                  height: 33,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                ),
              ),
              Positioned(
                left: 183,
                top: 8,
                child: Container(
                  width: 19,
                  height: 19,
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 19,
                top: 126,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: ShapeDecoration(
                    color: Color(0xFFEBCFCC),
                    shape: OvalBorder(
                      side: BorderSide(width: 1, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 129,
                top: 184,
                child: SizedBox(
                  width: 80,
                  height: 22,
                  child: Text(
                    'username',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 122,
                top: 147,
                child: SizedBox(
                  width: 73,
                  height: 29,
                  child: Text(
                    'Name',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: 'Inter',
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 113,
                top: 45,
                child: SizedBox(
                  width: 163,
                  height: 29,
                  child: Text(
                    'Profile',
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
                left: 104,
                top: 269,
                child: SizedBox(
                  width: 168,
                  height: 23,
                  child: Text(
                    'Edit Profile',
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
                left: 104,
                top: 348,
                child: SizedBox(
                  width: 168,
                  height: 23,
                  child: Text(
                    'My Stats',
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
                left: 104,
                top: 427,
                child: SizedBox(
                  width: 168,
                  height: 23,
                  child: Text(
                    'Notifications',
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
                left: 104,
                top: 504,
                child: SizedBox(
                  width: 168,
                  height: 23,
                  child: Text(
                    'Settings',
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
                left: 104,
                top: 581,
                child: SizedBox(
                  width: 168,
                  height: 23,
                  child: Text(
                    'About',
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
                left: 104,
                top: 707,
                child: SizedBox(
                  width: 168,
                  height: 23,
                  child: Text(
                    'Logout',
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
                left: 334,
                top: 272,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/20/20"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 334,
                top: 348,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/20/20"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 334,
                top: 430,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/20/20"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 334,
                top: 507,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/20/20"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 334,
                top: 584,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/20/20"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 334,
                top: 710,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/20/20"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 31,
                top: 255,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/50/50"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 31,
                top: 334,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/50/50"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 31,
                top: 490,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/50/50"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 31,
                top: 413,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/50/50"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 31,
                top: 567,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/50/50"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 31,
                top: 694,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/50/50"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 25,
                top: 39,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
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
      ],
    );
  }
}
