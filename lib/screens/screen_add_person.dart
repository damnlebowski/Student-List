// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:students_list/db/functions/db_functions.dart';
import 'package:students_list/db/model/data_model.dart';
import 'package:image_picker/image_picker.dart';

String? imagePath = '';

class AddPerson extends StatelessWidget {
  AddPerson({super.key});

  final _nameControler = TextEditingController();
  final _ageControler = TextEditingController();
  final _emailControler = TextEditingController();
  final _phoneControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  ToChooseImage(),
                  SizedBox(height: 20),
                  textFieldCall(
                      ht: 'Enter Your Name',
                      lt: 'Name',
                      control: _nameControler),
                  SizedBox(height: 10),
                  textFieldCall(
                      ht: 'Enter Your Age',
                      lt: 'Age',
                      control: _ageControler,
                      kt: TextInputType.number,
                      ml: 2),
                  SizedBox(height: 10),
                  textFieldCall(
                      ht: 'Enter Your Email',
                      lt: 'Email',
                      control: _emailControler,
                      kt: TextInputType.emailAddress),
                  SizedBox(height: 10),
                  textFieldCall(
                      ht: 'Enter Your Phone Number',
                      lt: 'Phone Number',
                      control: _phoneControler,
                      kt: TextInputType.number,
                      ml: 10),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel')),
                      SizedBox(width: 25),
                      ElevatedButton(
                          onPressed: () {
                            fieldCheck(context);
                          },
                          child: Text('Save')),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  fieldCheck(BuildContext context) async {
    final nameFromController = _nameControler.text.trim();
    final ageFromController = _ageControler.text.trim();
    final emailFromController = _emailControler.text.trim();
    final phoneFromController = _phoneControler.text.trim();

    if (nameFromController.isEmpty ||
        ageFromController.isEmpty ||
        emailFromController.isEmpty ||
        phoneFromController.isEmpty) {
      return;
    } else {
      final StudentDetailsObject = Studentmodel(
          name: nameFromController,
          age: ageFromController,
          email: emailFromController,
          phone: phoneFromController,
          imagePath: imagePath);

      addStudent(StudentDetailsObject);
      Navigator.of(context).pop();
    }
  }

  textFieldCall(
      {required ht, required lt, required control, kt = null, ml = null}) {
    return TextField(
      controller: control,
      decoration: InputDecoration(
          border: OutlineInputBorder(), hintText: ht, labelText: lt),
      keyboardType: kt,
      maxLength: ml,
    );
  }
}

class ToChooseImage extends StatefulWidget {
  const ToChooseImage({
    Key? key,
  }) : super(key: key);

  @override
  State<ToChooseImage> createState() => _ToChooseImageState();
}

class _ToChooseImageState extends State<ToChooseImage> {
  picImage({required ImageSource source}) async {
    final imagePicked = await ImagePicker().getImage(source: source);
    if (imagePicked != null) {
      setState(() {
        imagePath = imagePicked.path;
      });
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        picImage(source: ImageSource.gallery);
      },
      child: imageMethode(),
    );
  }
}

CircleAvatar imageMethode() {
  return CircleAvatar(
    radius: 50,
    child: Image.file(
      File(imagePath!),
      height: 300,
      width: 300,
      fit: BoxFit.cover,
    ),
  );
}

CircleAvatar imageLeadingMethode() {
  return CircleAvatar(
    child: Image.file(
      File(imagePath!),
    ),
  );
}
