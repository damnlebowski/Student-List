import 'package:hive_flutter/adapters.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class Studentmodel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String age;

  @HiveField(3)
  final String email;

  @HiveField(4)
  final String phone;

  @HiveField(5)
  final dynamic imagePath;

  Studentmodel(
      {required this.name,
      required this.age,
      required this.email,
      required this.phone,
      this.id,
      this.imagePath});
}
