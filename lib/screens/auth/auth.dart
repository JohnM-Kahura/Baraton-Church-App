// ignore_for_file: file_names

import 'dart:io';

import 'package:baratonchurch/screens/home/mainactivity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  String activeTab = 'Student';
  bool studentActive = true;
  bool adminActive = false;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController firstNameAdminController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController studentIdController = TextEditingController();
  TextEditingController studentIdAdminController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String firstName = '';
  String middleName = '';
  String lastName = '';
  String studentId = '';
  String firstNameAdmin = '';
  String studentIdAdmin = '';
  String password = '';
  Future writeFirstName(String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('firstName', value);
  }

  Future writeMiddleName(String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('middleName', value);
  }

  Future writeLastName(String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('lastName', value);
  }

  Future writeStudentId(String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('studentId', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.width - 50,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
            ),
            child: Container(
              margin: const EdgeInsets.only(
                top: 40,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Baraton Church",
                    style: GoogleFonts.oxygen(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 150, left: 25, right: 25),
            height: MediaQuery.of(context).size.height - 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: activeTab == 'Student'
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        studentActive
                                            ? Colors.blueGrey
                                            : Colors.blueGrey.shade300),
                              ),
                              onPressed: () {
                                setState(() {
                                  adminActive = false;
                                  studentActive = true;
                                  activeTab = 'Student';
                                });
                              },
                              child: Text(
                                'Student',
                                style: GoogleFonts.oxygen(
                                  color: Colors.white,
                                  // fontSize: 10,
                                ),
                              ),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(adminActive
                                        ? Colors.blueGrey
                                        : Colors.blueGrey.shade300),
                              ),
                              onPressed: () {
                                setState(() {
                                  studentActive = false;
                                  adminActive = true;
                                  activeTab = 'Admin';
                                });
                              },
                              child: Text(
                                'Admin',
                                style: GoogleFonts.oxygen(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        customTextFeild('First Name', firstNameController),
                        const SizedBox(
                          height: 10,
                        ),
                        customTextFeild('Middle Name', middleNameController),
                        const SizedBox(
                          height: 10,
                        ),
                        customTextFeild('Last Name', lastNameController),
                        const SizedBox(
                          height: 10,
                        ),
                        customTextFeild('Student ID', studentIdController),
                        const SizedBox(
                          height: 30,
                        ),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blueGrey),
                          ),
                          onPressed: () async {
                            firstName = firstNameController.text;
                            middleName = middleNameController.text;
                            lastName = lastNameController.text;
                            studentId = studentIdController.text;
                            writeFirstName(firstName);
                            writeMiddleName(middleName);
                            writeLastName(lastName);
                            writeStudentId(studentId);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainActivity()));
                          },
                          child: Text(
                            'Continue',
                            style: GoogleFonts.oxygen(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        studentActive
                                            ? Colors.blueGrey
                                            : Colors.blueGrey.shade300),
                              ),
                              onPressed: () {
                                setState(() {
                                  adminActive = false;
                                  studentActive = true;
                                  activeTab = 'Student';
                                });
                              },
                              child: Text(
                                'Student',
                                style: GoogleFonts.oxygen(
                                  color: Colors.white,
                                  // fontSize: 10,
                                ),
                              ),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(adminActive
                                        ? Colors.blueGrey
                                        : Colors.blueGrey.shade300),
                              ),
                              onPressed: () {
                                setState(() {
                                  studentActive = false;
                                  adminActive = true;
                                  activeTab = 'Admin';
                                });
                              },
                              child: Text(
                                'Admin',
                                style: GoogleFonts.oxygen(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        customTextFeild(
                            'Enter first name', firstNameAdminController),
                        const SizedBox(
                          height: 10,
                        ),
                        customTextFeild(
                            'Enter School id', studentIdAdminController),
                        const SizedBox(
                          height: 10,
                        ),
                        customTextFeild('Enter password', passwordController),
                        const SizedBox(
                          height: 30,
                        ),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blueGrey),
                          ),
                          onPressed: () {
                            firstNameAdmin = firstNameAdminController.text;
                            studentIdAdmin = studentIdAdminController.text;
                            password = passwordController.text;
                            print(firstName);
                            print(studentIdAdmin);
                            print(password);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainActivity()));
                          },
                          child: Text(
                            'log in',
                            style: GoogleFonts.oxygen(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

Widget customTextFeild(String hint, TextEditingController controller) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hint,
      contentPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
    ),
    cursorColor: Colors.blueGrey,
  );
}
