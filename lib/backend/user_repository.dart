import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trackin_n_bingein/backend/models/userModel.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  createUser(UserModel user) async{
    await _db.collection('User').add(user.toJson());
  }
}
