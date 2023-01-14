// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:students_list/db/model/data_model.dart';

class EditPerson extends StatefulWidget {
  EditPerson({super.key, required this.studentmodel});
  final Studentmodel studentmodel;
  @override
  State<EditPerson> createState() => _EditPersonState();
}

class _EditPersonState extends State<EditPerson> {
  TextEditingController? _nameController;
  TextEditingController? _ageController;
  TextEditingController? _emailController;
  TextEditingController? _phoneController;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.studentmodel.name);
    _ageController = TextEditingController(text: widget.studentmodel.age);
    _emailController = TextEditingController(text: widget.studentmodel.email);
    _phoneController = TextEditingController(text: widget.studentmodel.phone);

    super.initState();
  }

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
                  GestureDetector(
                    onTap: () {
                      print(widget.studentmodel.age);
                    },
                    child: CircleAvatar(
                      radius: 50,
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        size: 50,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  textFieldCall(
                      ht: 'Enter Your Name',
                      lt: 'Name',
                      control: _nameController),
                  SizedBox(height: 10),
                  textFieldCall(
                      ht: 'Enter Your Age',
                      lt: 'Age',
                      control: _ageController,
                      kt: TextInputType.number,
                      ml: 2),
                  SizedBox(height: 10),
                  textFieldCall(
                      ht: 'Enter Your Email',
                      lt: 'Email',
                      control: _emailController,
                      kt: TextInputType.emailAddress),
                  SizedBox(height: 10),
                  textFieldCall(
                      ht: 'Enter Your Phone Number',
                      lt: 'Phone Number',
                      control: _phoneController,
                      kt: TextInputType.number,
                      ml: 10),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel')),
                      SizedBox(width: 25),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Update')),
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

  fieldCheck() async {
    final _name = _nameController!.text.trim();
    final _age = _ageController!.text.trim();
    final _email = _emailController!.text.trim();
    final _phone = _phoneController!.text.trim();

    if (_name.isEmpty || _age.isEmpty || _email.isEmpty || _phone.isEmpty) {
      return;
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
