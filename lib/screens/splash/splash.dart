import 'dart:async';

import 'package:baratonchurch/screens/auth/Auth.dart';
import 'package:baratonchurch/screens/home/mainactivity.dart';
import 'package:baratonchurch/screens/splash/data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Auth())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        margin: const EdgeInsets.only(top: 50, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'images/church_logo.png',
              width: MediaQuery.of(context).size.width - 100,
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Text(
                motto,
                style: GoogleFonts.oxygen(
                  fontSize: 20,
                  color: Colors.white54,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.teal.shade700,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
