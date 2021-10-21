import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCode extends StatefulWidget {
  const QrCode({Key? key}) : super(key: key);

  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  String firstName = 'empty';
  String middleName = 'empty';
  String lastName = 'empty';
  String studentId = 'empty';

  readFromHive() async {
    var box = await Hive.openBox('students');
    var student = box.get('student');
    setState(() {
      firstName = student.firstName;
      middleName = student.middleName;
      lastName = student.lastName;
      studentId = student.studentId;
    });
  }

  @override
  void initState() {
    readFromHive();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          QrImage(
            data: studentId,
          ),
          Text(firstName + middleName + lastName + studentId)
        ],
      ),
    );
  }
}
