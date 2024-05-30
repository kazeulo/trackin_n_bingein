import 'dart:io';

class CategoryModel{
  final String? id;
  final String userId;
  final String name;

  const CategoryModel({
    this.id,
    required this.userId,
    required this.name,
  });

  // convert category model to JSON
  Map <String, dynamic> toJson(){
    return {
      'Name': name,
      'UserId': userId,
    };
  }
}