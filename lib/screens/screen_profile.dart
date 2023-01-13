// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:students_list/screens/screen_add_person.dart';

var studentNameSaved;
var studentAgeSaved;
var studentEmailSaved;
var studentPhoneSaved;
dynamic imagePathSaved;

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 10,
        ),
        Center(
          child: imageMethode(),
        ),
        SizedBox(
          height: 50,
        ),
        Text('               Name            :              $studentNameSaved'),
        SizedBox(
          height: 25,
        ),
        Text(
            '               Age                :              $studentAgeSaved'),
        SizedBox(
          height: 25,
        ),
        Text(
            '               Mobile           :              $studentPhoneSaved'),
        SizedBox(
          height: 25,
        ),
        Text(
            '               Email             :              $studentEmailSaved'),
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
