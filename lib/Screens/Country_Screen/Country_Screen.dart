// ignore_for_file: file_names, prefer_const_constructors, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Models/Country_Model.dart';
import 'package:whatsapp/Screens/Login_Screen/Login_Screen.dart';

class CountryScreen extends StatefulWidget {
  CountryScreen({Key? key}) : super(key: key);

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  List<CountryModel> countries = [
    CountryModel(
      name: "India",
      code: "+91",
      flag:
          "https://images.emojiterra.com/google/noto-emoji/v2.028/128px/1f1ee-1f1f3.png",
    ),
    CountryModel(
      name: "Pakistan",
      code: "+92",
      flag:
          "https://images.emojiterra.com/google/noto-emoji/v2.028/128px/1f1f5-1f1f0.png",
    ),
    CountryModel(
      name: "United States",
      code: "+1",
      flag:
          "https://images.emojiterra.com/google/noto-emoji/v2.028/128px/1f1fa-1f1f8.png",
    ),
    CountryModel(
      name: "South Africa",
      code: "+27",
      flag:
          "https://images.emojiterra.com/google/noto-emoji/v2.028/128px/1f1ff-1f1e6.png",
    ),
    CountryModel(
      name: "Afghanistan",
      code: "+93",
      flag:
          "https://images.emojiterra.com/google/noto-emoji/v2.028/128px/1f1e6-1f1eb.png",
    ),
    CountryModel(
      name: "United Kingdom",
      code: "+44",
      flag:
          "https://images.emojiterra.com/google/noto-emoji/v2.028/128px/1f1ec-1f1e7.png",
    ),
    CountryModel(
      name: "Italy",
      code: "+39",
      flag:
          "https://images.emojiterra.com/google/noto-emoji/v2.028/128px/1f1ee-1f1f9.png",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose a country',
          style: TextStyle(
            color: one,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: one,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (
          context,
          index,
        ) =>
            card(
          countries[index],
        ),
      ),
    );
  }

  Widget card(CountryModel country) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (builder) => LoginScreen(
              country: country.name,
              countryCode: country.code,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.transparent,
        margin: EdgeInsets.all(
          0.15,
        ),
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 5.0,
          ),
          child: Row(
            children: [
              Image.network(
                country.flag,
                width: 30,
                height: 30,
              ),
              SizedBox(
                width: 15,
              ),
              Text(country.name),
              Expanded(
                child: Container(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(country.code),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
