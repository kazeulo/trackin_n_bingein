import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trackin_n_bingein/authentication/user_auth.dart';
import 'package:trackin_n_bingein/screens/editprofile.dart';
import 'package:trackin_n_bingein/screens/signin.dart';
import 'package:trackin_n_bingein/styling/styling.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100), 
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
          const Text(
            "Customize your page",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
            textAlign: TextAlign.left,
          ),

          const SizedBox(height: 10), 
          Padding(
            padding: const EdgeInsets.only(top: 90),
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
                      const SizedBox(height: 10),
                      buildCardWithIcon(
                        title: 'Log Out',
                        icon: Icons.logout,
                        onTap: () {
                          showLogoutConfirmationDialog(context);
                        },
                      ),
                      const SizedBox(height: 10),
                      buildCardWithIcon(
                        title: 'Delete Account',
                        icon: Icons.delete,
                        onTap: () {
                          showDeleteAccountDialog(context);
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
          title: const Text("Confirm Logout"),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Yes"),
              onPressed: () {
                FirebaseAuth.instance.signOut();
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

void showDeleteAccountDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Delete Account"),
        content: const Text(
          "Are you sure you want to delete your account? If you delete your account, you will lose all your data. Continue? "
        ),
        actions: [
          TextButton(
            child: const Text("No"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text("Yes"),
            onPressed: () async {
              await FirebaseAuthentication().deleteUserAccount();
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
    cardColor ??= isDarker ? Styling.textColor1 : const Color.fromARGB(255, 197, 219, 221);

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
                  style: const TextStyle(
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