// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/About_UPI/About_UPI.dart';
import 'package:whatsapp/Screens/How_To_Send_Money/How_To_Send_Money.dart';
import 'package:whatsapp/Screens/How_to_add_your_bank_account/How_to_add_your_bank_account.dart';
import 'package:whatsapp/Screens/How_to_receive_money/How_to_receive_money.dart';
import 'package:whatsapp/Screens/Issue_Type/Issue_Type.dart';
import 'package:whatsapp/Screens/Issues_With_Payments/Issues_With_Payments.dart';
import 'package:whatsapp/Screens/Payments_Data/Payments_data.dart';

class SearchHelpCentre extends StatefulWidget {
  SearchHelpCentre({Key? key}) : super(key: key);

  @override
  _SearchHelpCentreState createState() => _SearchHelpCentreState();
}

class _SearchHelpCentreState extends State<SearchHelpCentre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Help Centre',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 20.0,
                bottom: 10.0,
                left: 28.0,
              ),
              child: Text(
                'Is this your question?',
                style: TextStyle(
                  color: grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
                left: 10.0,
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => HowToAddBankAccount(),
                    ),
                  );
                },
                title: Text(
                  'How to add your bank account',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Divider(
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
                left: 10.0,
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => HowToReceiveMoney(),
                    ),
                  );
                },
                title: Text(
                  'How to receive money',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Divider(
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
                left: 10.0,
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => HowToSendMoney(),
                    ),
                  );
                },
                title: Text(
                  'How to send money',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Divider(
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
                left: 10.0,
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => AboutUPI(),
                    ),
                  );
                },
                title: Text(
                  'About UPI',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Divider(
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
                left: 10.0,
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => IssuesWithPayments(),
                    ),
                  );
                },
                title: Text(
                  'Issues with payments',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Divider(
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
                left: 10.0,
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => PaymentsData(),
                    ),
                  );
                },
                title: Text(
                  'Payments data',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8.0,
              ),
              child: ListTile(
                tileColor: one,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => IssueType(),
                    ),
                  );
                },
                title: Center(
                  child: Text(
                    "This doesn't answer my question",
                    style: TextStyle(
                      color: white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
