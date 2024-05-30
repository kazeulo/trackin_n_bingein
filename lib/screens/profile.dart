import 'package:flutter/material.dart';
import 'package:trackin_n_bingein/screens/editprofile.dart';
import 'package:trackin_n_bingein/styling/styling.dart';
import 'package:trackin_n_bingein/screens/signin.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100), 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              // should be changed to appbar 
              "Settings",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
            
          ),
          Text(
            "Customize your page",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
            textAlign: TextAlign.left,
          ),

          SizedBox(height: 10), 
          Padding(
            padding: EdgeInsets.only(top: 90),
            child: Container(
              child: Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildCardWithIcon(
                        title: 'Edit Profile',
                        icon: Icons.person,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const EditProfile()),
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      buildCardWithIcon(
                        title: 'Log Out',
                        icon: Icons.logout,
                        onTap: () {
                          showLogoutConfirmationDialog(context);
                        },
                      ),
                      SizedBox(height: 10),
                      buildCardWithIcon(
                        title: 'Delete Account',
                        icon: Icons.delete,
                        onTap: () {
                          // implement b-end
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Logout"),
          content: Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Signin()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildCardWithIcon({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    bool isDarker = false,
    Color? cardColor,
  }) {
    // for color wanted to implement delete to be a shade darker
    cardColor ??= isDarker ? Styling.textColor1 : Color.fromARGB(255, 197, 219, 221);

    return Card(
      color: cardColor,
      elevation: 4,
      child: SizedBox(
        width: 300,
        height: 70,
        // color:cardColor,
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Styling.textColor3,
                  ),
                ),
              ),
              Icon(icon),  
            ],
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
