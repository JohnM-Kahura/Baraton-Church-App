import 'package:baratonchurch/utils/student.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QrCode extends StatefulWidget {
  const QrCode({Key? key}) : super(key: key);

  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  String firstName = '';
  String middleName = '';
  String lastName = '';
  String studentId = '';
  Future readFirstName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      firstName = pref.getString('firstName')!;
    });
  }

  Future readMiddleName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      middleName = pref.getString('middleName')!;
    });
  }

  Future readLastName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      lastName = pref.getString('lastName')!;
    });
  }

  Future readStudentId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      studentId = pref.getString('studentId')!;
    });
  }

  Future clear() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  @override
  void initState() {
    readFirstName();
    readMiddleName();
    readLastName();
    readStudentId();
    clear();

    super.initState();
    print('firstname' + firstName);
    print('middlename' + middleName);
    print('lastname' + lastName);
    print('studentId' + studentId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          QrImage(
            data: 'SKAHMU2011',
          ),
          Text(firstName + middleName + lastName + studentId)
        ],
      ),
    );
  }
}
