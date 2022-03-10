// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/Payments_Screen/Payments_Screen.dart';
import 'package:whatsapp/Screens/Search_Help_Centre/Search_help_Centre.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  _launchURL() async {
    const url = 'https://faq.whatsapp.com/general/payments/about-payments-data';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payments'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => PaymentsScreen(),
                    ),
                  );
                },
                leading: Icon(
                  Icons.monetization_on,
                  color: one,
                  size: 30,
                ),
                title: Text(
                  'Send payment',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
              ),
              child: ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.qr_code,
                  color: one,
                  size: 30,
                ),
                title: Text(
                  'Scan payment QR code',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 6,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    left: 10.0,
                    bottom: 20.0,
                  ),
                  child: Text(
                    'History',
                    style: TextStyle(
                      color: one,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.assignment_sharp,
                  color: grey,
                  size: 40,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'No payment history',
                  style: TextStyle(
                    color: grey,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 6,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    left: 10.0,
                    bottom: 20.0,
                  ),
                  child: Text(
                    'Payment methods',
                    style: TextStyle(
                      color: one,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: one.withOpacity(0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8.0,
                      bottom: 8.0,
                    ),
                    child: ListTile(
                      onTap: () {
                        _launchURL();
                      },
                      leading: Icon(
                        Icons.verified_user_rounded,
                        color: one,
                        size: 30,
                      ),
                      title: Text(
                        'To protect your security, WhatsApp does not store you UPI PIN or full bank account number.',
                        style: TextStyle(
                          fontSize: 15,
                          color: grey,
                        ),
                      ),
                      subtitle: Text(
                        'Learn more',
                        style: TextStyle(
                          fontSize: 15,
                          color: blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
              ),
              child: ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.add_circle_outline_outlined,
                  color: grey,
                  size: 30,
                ),
                title: Text(
                  'Add payment method',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 6,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => SearchHelpCentre(),
                    ),
                  );
                },
                leading: Icon(
                  Icons.help_outline,
                  color: grey,
                  size: 30,
                ),
                title: Text(
                  'Help',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            Center(
              child: Image.asset(
                '../assets/images/upi.png',
                width: 70,
                height: 70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
