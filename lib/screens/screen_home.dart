// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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
  @override
  void initState() {
    getAllStudents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  decoration: InputDecoration(
                      labelText: 'Search', suffixIcon: Icon(Icons.search)),
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
                          // imagePath: imagePath
                        );
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return ProfilePage();
                        }));
                      },
                      leading: imageLeadingMethode(),
                      title: Text(data.name),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                if (data.id != null) {
                                  toDeleteStudent(data.id!);
                                  print('${data.id}');
                                } else {
                                  print('${data.id}');
                                }
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
}
