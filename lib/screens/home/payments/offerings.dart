import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Offerings extends StatefulWidget {
  const Offerings({Key? key}) : super(key: key);

  @override
  _OfferingsState createState() => _OfferingsState();
}

class _OfferingsState extends State<Offerings> {
  final String text =
      '''Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum''';
  List title=['Offerings','Tithes','Contributions'];
  List buttonTitle=['Make payment','Make payment','Contribute'];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: title.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: const EdgeInsets.only(top: 5),
              child: Container(
                color: Colors.blueGrey,
                height: MediaQuery.of(context).size.width - 175,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title[index],
                            style: GoogleFonts.oxygen(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            text,
                            style: GoogleFonts.openSansCondensed(
                              fontSize: 15,
                              color:Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              onPressed: () {},
                              child: Text(
                                buttonTitle[index],
                                style: GoogleFonts.oxygen(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
