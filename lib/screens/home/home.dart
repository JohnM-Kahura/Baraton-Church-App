import 'package:baratonchurch/screens/home/notificationApi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isReminder = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 3),
              height: MediaQuery.of(context).size.width - 120,
              width: double.infinity,
              color: Colors.red,
              child: Stack(
                children: [
                  Image(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width - 120,
                      fit: BoxFit.fill,
                      image: const AssetImage('images/background.jpg')),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Know Where you are going ',
                        style: GoogleFonts.oxygen(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            'By Dr. Rei Kesis',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Monday Service',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              NotificationsApi.showNotification(
                                  title: 'Baraton Church',
                                  body: 'fuck the government',
                                  payload: 'church stuff');
                              print('object');
                              // setState(() {
                              //   isReminder = !isReminder;
                              // });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Icon(
                                    isReminder
                                        ? Icons.notifications_active
                                        : Icons.notifications,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.event,
                                color: Colors.white,
                              ),
                              Text(
                                'Monday',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '5:00-6:00pm',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          const Text(
                            '12/10/2021',
                            style: TextStyle(
                              color: Colors.white,
                              // fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
