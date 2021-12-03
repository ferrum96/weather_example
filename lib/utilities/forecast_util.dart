import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  static String getFormattedData(DateTime dateTime) {
    return DateFormat('EEE, MMM, d, y').format(dateTime);
  }

  static getItem(IconData iconData, int data, String units) {
    return Column(
      children: [
        Icon(
          iconData,
          color: Colors.white,
          size: 30.0,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '$data',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '$units',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
