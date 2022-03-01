import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
 static String firstName = 'hskdjthjkshj';
  String middleName = '';
  String lastName = '';
  String studentId = '';

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

  //firstname middlename lastname editing  controller

  TextEditingController fnameEditController = TextEditingController(text:firstName);

  // TextEditingController mnameEditController = TextEditingController();
  // TextEditingController lnameEditController = TextEditingController();
  // TextEditingController studentIdEditController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            color: Colors.red,
            // height: 300,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Account',
                      style: GoogleFonts.oxygen(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                customTextFeild('First name'),
                const SizedBox(height: 10),
                customTextFeild(
                  'Middle name',
                ),
                const SizedBox(height: 10),
                customTextFeild('Last name'),
                const SizedBox(height: 10),
                customTextFeild('Student id'),
                const SizedBox(height: 10),
                customTextFeild('Phone number'),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Container(
            color: Colors.green,
            height: 300,
          ),
        ],
      ),
    );
  }
}

Widget customTextFeild(String labelText) {
  return TextFormField(
    // onChanged: ,

    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.black, fontSize: 14),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    ),
    cursorColor: Colors.blueGrey,
  );
}
