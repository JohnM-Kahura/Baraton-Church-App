import 'package:baratonchurch/utils/student.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
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

  reedFromHive() async {
    final appDir = await getApplicationDocumentsDirectory();

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
    reedFromHive();

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
