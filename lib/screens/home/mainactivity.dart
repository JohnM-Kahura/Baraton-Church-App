import 'package:baratonchurch/screens/home/home.dart';
import 'package:baratonchurch/screens/home/payments/offerings.dart';
import 'package:baratonchurch/screens/home/qr/qr.dart';
import 'package:baratonchurch/screens/home/settings/settings.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class MainActivity extends StatefulWidget {
  const MainActivity({Key? key}) : super(key: key);

  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  int _currentIndex = 0;
  //tabs in the app
  List<Widget> tabs = [Home(), QrCode(), Offerings(), Settings()];
  List title = ['Home', 'Qr Code', 'Payments', 'Settings'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(title[_currentIndex])),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.blueGrey,
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.qr_code),
            title: const Text('Qr Code'),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.payment),
            title: const Text(
              'Payments ',
            ),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.settings),
            title: const Text('Settings'),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
