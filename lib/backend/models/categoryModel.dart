class CategoryModel {
  final String? id;
  final String userId;
  final String name;
  final double overallStat; 

  const CategoryModel({
    this.id,
    required this.userId,
    required this.name,
    required this.overallStat,
  });

  // convert category model to JSON
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'UserId': userId,
      'OverallStat': overallStat,
    };
  }
}
