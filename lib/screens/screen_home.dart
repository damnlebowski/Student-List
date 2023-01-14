// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:students_list/db/functions/db_functions.dart';
import 'package:students_list/screens/screen_add_person.dart';
import 'package:students_list/screens/screen_profile.dart';
import '../db/model/data_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchControler = TextEditingController();

  List<Studentmodel> studentList = Hive.box<Studentmodel>('student_db')
      .values
      .toList(); //.........................second one
  final studentDB = Hive.openBox<Studentmodel>('student_db');
  late List<Studentmodel> studentDisplay = List<Studentmodel>.from(
      studentDisplay); //.........................first one

  @override
  void initState() {
    getAllStudents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Students List'),
          ],
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder: (ctx, List<Studentmodel> studentListObject, Widget? child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: searchControler,
                  decoration: InputDecoration(
                      labelText: 'Search', suffixIcon: Icon(Icons.search)),
                  onChanged: (value) {
                    // search ivede
                    _searchStudent(value);
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (ctx, index) {
                    final data = studentListObject[index];
                    return ListTile(
                      onTap: () {
                        studentDetailsCall(
                          studentName: data.name,
                          studentAge: data.age,
                          studentemail: data.email,
                          studentphone: data.phone,
                        );
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return ProfilePage(
                            studentmodel: data,
                          );
                        }));
                      },
                      leading: imageLeadingMethode(image: data.imagePathFirst),
                      title: Text(data.name),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                toDeleteStudent(index);
                              },
                              icon: Icon(Icons.delete)),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.more_vert)),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: ((context, index) {
                    return Divider();
                  }),
                  itemCount: studentListObject.length,
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return AddPerson();
          }));
        },
        child: Icon(Icons.person_add_alt_1_sharp),
      ),
    );
  }

  void _searchStudent(String value) {
    setState(() {
      // studentDisplay = studentList
      //     .where((element) =>
      //         element.name.toLowerCase().contains(value.toLowerCase()))
      //     .toList();
      studentDisplay = studentList
          .where((student) => student.name.toLowerCase())
          .contains(value.toLowerCase());
    });
  }
}
