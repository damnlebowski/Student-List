import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/data_model.dart';

ValueNotifier<List<Studentmodel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(Studentmodel value) async {
  final studentDB = await Hive.openBox<Studentmodel>('student_db');

  final _id = await studentDB.add(value);
  value.id = _id;
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<Studentmodel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> toDeleteStudent(int id) async {
  final studentDB = await Hive.openBox<Studentmodel>('student_db');

  studentDB.deleteAt(id);
  getAllStudents();
}
