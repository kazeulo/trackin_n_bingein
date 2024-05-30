import 'dart:io';

class UserModel{
  final String? id;
  final String username;
  final String email;
  final String password;
  final File? profilePicture;

  const UserModel({
    this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.profilePicture
  });

  toJson(){
    return{
      'Username': username,
      'Email': email,
      'Password': password,
      'ProfilePicture': profilePicture
    };
  }
}