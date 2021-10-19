import 'package:baratonchurch/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final docDir = await getApplicationDocumentsDirectory();
  Hive.init(docDir.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Baraton Church',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const Splash(),
    );
  }
}
