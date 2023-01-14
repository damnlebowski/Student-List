// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:students_list/db/model/data_model.dart';
// import 'package:students_list/screens/screen_add_person.dart';
import 'package:students_list/screens/screen_edit_person.dart';

var studentNameSaved;
var studentAgeSaved;
var studentEmailSaved;
var studentPhoneSaved;
dynamic imagePathSaved;

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key, required this.studentmodel});
  final Studentmodel studentmodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 10,
        ),
        Center(
          child: CircleAvatar(
            radius: 100,
            backgroundImage: FileImage(
              File(studentmodel.imagePathFirst),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Text(
            '               Name            :              ${studentmodel.name}'),
        SizedBox(
          height: 25,
        ),
        Text(
            '               Age                :              ${studentmodel.age}'),
        SizedBox(
          height: 25,
        ),
        Text(
            '               Mobile           :              ${studentmodel.phone}'),
        SizedBox(
          height: 25,
        ),
        Text(
            '               Email             :              ${studentmodel.email}'),
        SizedBox(
          height: 50,
        ),
        Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close')),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // final data = studentmodel;
          // studentDetailsCall(
          //                 studentName: data.name,
          //                 studentAge: data.age,
          //                 studentemail: data.email,
          //                 studentphone: data.phone,
          //               );
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return EditPerson(
              studentmodel: studentmodel,
            );
          }));
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}

studentDetailsCall({
  required studentName,
  required studentAge,
  required studentemail,
  required studentphone,
  // required imagePath
}) {
  studentNameSaved = studentName;
  studentAgeSaved = studentAge;
  studentEmailSaved = studentemail;
  studentPhoneSaved = studentphone;
  //imagePathSaved = imagePath;
}
