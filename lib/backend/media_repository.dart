import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trackin_n_bingein/backend/models/mediaModel';
import 'package:get/get.dart';

class MediaRepository extends GetxController {
  static MediaRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  createUser(MediaModel media) async{
    await _db.collection('Media').add(media.toJson());
  }
}
