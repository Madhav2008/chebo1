// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:whatsapp/Screens/Cant_Receive_Money/Cant_Receive_Money.dart';
import 'package:whatsapp/Screens/Cant_Send_Money/Cant_Send_Money.dart';
import 'package:whatsapp/Screens/Contact_Support/Contact_Support.dart';
import 'package:whatsapp/Screens/Payments_Security/Payments_Security.dart';
import 'package:whatsapp/Screens/Problems_With_My_Bank_Or_Bank_Account/Problems_With_My_Bank_Or_Bank_Account.dart';
import 'package:whatsapp/Screens/UPI_PIN/UPI_PIN.dart';

class IssueType extends StatefulWidget {
  const IssueType({Key? key}) : super(key: key);

  @override
  _IssueTypeState createState() => _IssueTypeState();
}

class _IssueTypeState extends State<IssueType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "What is the issue with?",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 10.0,
            ),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => CantSendMoney(),
                  ),
                );
              },
              title: Text(
                "Can't send money",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 10.0,
            ),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => CantReceiveMoney(),
                  ),
                );
              },
              title: Text(
                "Can't receive money",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 10.0,
            ),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => UPIPIN(),
                  ),
                );
              },
              title: Text(
                'UPI PIN',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 10.0,
            ),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ProblemsWithMyBankOrBankAccount(),
                  ),
                );
              },
              title: Text(
                'Problem with my bank or bank account',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 10.0,
            ),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => PaymentsSecurity(),
                  ),
                );
              },
              title: Text(
                'Payments security',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 10.0,
            ),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ContactSupport(),
                  ),
                );
              },
              title: Text(
                "Can't find what I'm looking for",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
