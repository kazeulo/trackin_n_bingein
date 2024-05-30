import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  late final String _email;
  UserService(this._email);

  Future<String> fetchUsername(String email) async {
    try {
      // Fetch username from Firestore based on stored email
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
          .collection('User')
          .where('Email', isEqualTo: _email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Assuming there is only one document with the given email
        return querySnapshot.docs.first.get('Username');
      } else {
        throw Exception('No user found with email: $_email');
      }
    } catch (e) {
      print('Error fetching username: $e');
      throw Exception('Failed to fetch username');
    }
  }

  Future<String> fetchUserId() async {
    try {
      // Fetch user ID from Firestore based on stored email
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
          .collection('User')
          .where('Email', isEqualTo: _email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Assuming there is only one document with the given email
        return querySnapshot.docs.first.id;
      } else {
        throw Exception('No user found with email: $_email');
      }
    } catch (e) {
      print('Error fetching user ID: $e');
      throw Exception('Failed to fetch user ID');
    }
  }
}
