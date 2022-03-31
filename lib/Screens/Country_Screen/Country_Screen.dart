// ignore_for_file: file_names, prefer_const_constructors, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Models/Country_Model.dart';
import 'package:country_picker/country_picker.dart';

class CountryScreen extends StatefulWidget {
  CountryScreen({
    Key? key,
    required this.setCountryData,
  }) : super(key: key);

  final Function setCountryData;

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
      name: "South Africa",
      code: "+27",
      flag:
          "https://images.emojiterra.com/google/noto-emoji/v2.028/128px/1f1ff-1f1e6.png",
    ),
    CountryModel(
      name: "United States",
      code: "+1",
      flag:
          "https://images.emojiterra.com/google/noto-emoji/v2.028/128px/1f1fa-1f1f8.png",
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
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: 
      showCountryPicker(
              context: context,
              //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
              exclude: <String>['KN', 'MF'],
              //Optional. Shows phone code before the country name.
              showPhoneCode: true,
              showWorldWide: false,
              onSelect: (Country country) {
                print('Select country: ${country.displayName}');
              },
              // Optional. Sets the theme for the country list picker.
              countryListTheme: CountryListThemeData(
                // Optional. Sets the border radius for the bottomsheet.
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                // Optional. Styles the search field.
                inputDecoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Start typing to search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFF8C98A8).withOpacity(0.2),
                    ),
                  ),
                ),
              ),
            );
      // ListView.builder(
      //   itemCount: countries.length,
      //   itemBuilder: (
      //     context,
      //     index,
      //   ) =>
      //       card(
      //     countries[index],
      //   ),
      // ),
    );
  }

  Widget card(CountryModel country) {
    return GestureDetector(
      onTap: () {
        widget.setCountryData(country);
      },
      child: Card(
        color: transparent,
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
