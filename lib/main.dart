import 'package:baratonchurch/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MpesaFlutterPlugin.setConsumerKey('dL5sUnnKpljL9i8ZE7wrRcfAhJnvzh7I');
  MpesaFlutterPlugin.setConsumerSecret('7LysPoq22BeGxYWF');
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
