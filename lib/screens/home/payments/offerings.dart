import 'package:flutter/material.dart';

class Offerings extends StatefulWidget {
  const Offerings({Key? key}) : super(key: key);

  @override
  _OfferingsState createState() => _OfferingsState();
}

class _OfferingsState extends State<Offerings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('offerings')),
    );
  }
}
