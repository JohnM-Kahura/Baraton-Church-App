import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';

class Offerings extends StatefulWidget {
  const Offerings({Key? key}) : super(key: key);

  @override
  _OfferingsState createState() => _OfferingsState();
}

class _OfferingsState extends State<Offerings> {
  final String text =
      '''Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum''';
  List title = ['Offerings', 'Tithes', 'Contributions'];
  List buttonTitle = ['Make payment', 'Make payment', 'Contribute'];
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
                              color: Colors.white,
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
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () {
                              customDialogue(context);
                            },
                            child: Text(
                              buttonTitle[index],
                              style: GoogleFonts.oxygen(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

customDialogue(BuildContext context) {
  TextEditingController amountController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Container(
            height: MediaQuery.of(context).size.width - 100,
            color: Colors.white,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'How much would you like to pay',
                    style: GoogleFonts.oxygen(
                      // fontSize: 30,
                      // color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                customTextFeild('Phone 07xxxxxxxx', phoneController),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 100,
                  child: customTextFeild('Amount', amountController),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blueGrey,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueGrey,
                          ),
                        ),
                        onPressed: () async {
                          String phone = phoneController.text;

                          String amount = amountController.text;
                          if (phone.length < 10 || phone.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "The  number you provided is too short",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 2,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else if (amount.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Please enter amount you wish to pay",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else {
                            phone = phone.substring(1);
                            phone = '254' + phone;

                          await  startTransaction(
                                userPhone: phone, amount: double.parse(amount));
                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text(
                          'Continue',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                )
              ],
            ),
          ),
        );
      });
}

Widget customTextFeild(String hint, TextEditingController controller) {
  return TextField(
    keyboardType: TextInputType.number,
    autofocus: true,
    controller: controller,
    decoration: InputDecoration(
      hintText: hint,
      contentPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
    ),
    cursorColor: Colors.blueGrey,
  );
}

Future<void> startTransaction(
    {required String userPhone, required double amount}) async {
  //Preferably expect 'dynamic', response type varies a lot!
  dynamic transactionInitialisation;
  //Better wrap in a try-catch for lots of reasons.
  try {
    //Run it
    transactionInitialisation = await MpesaFlutterPlugin.initializeMpesaSTKPush(
        businessShortCode: "174379",
        transactionType: TransactionType.CustomerPayBillOnline,
        amount: amount,
        partyA: userPhone,
        partyB: "174379",
        callBackURL:
            Uri(scheme: "https", host: "1234.1234.co.ke", path: "/1234.php"),
        accountReference: "Bara Church",
        phoneNumber: userPhone,
        baseUri: Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
        transactionDesc: "Baraton Church",
        passKey:
            'bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919');

    print("TRANSACTION RESULT: " + transactionInitialisation.toString());

    //You can check sample parsing here -> https://github.com/keronei/Mobile-Demos/blob/mpesa-flutter-client-app/lib/main.dart

    /*Update your db with the init data received from initialization response,
      * Remaining bit will be sent via callback url*/
    return transactionInitialisation;
  } catch (e) {
    //For now, console might be useful
    print("CAUGHT EXCEPTION: " + e.toString());
    // dynamic error = 'An Error Occured Please try agin later';
    // return error;

    /*
      Other 'throws':
      1. Amount being less than 1.0
      2. Consumer Secret/Key not set
      3. Phone number is less than 9 characters
      4. Phone number not in international format(should start with 254 for KE)
       */
  }
}
