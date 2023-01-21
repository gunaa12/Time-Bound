// Imports
import 'package:flutter/material.dart';

// Colors
const kLightBlue = Color(0xA0C1B9);
const kDarkBlue = Color(0x70A0AF);
const kPurple = Color(0x712F79);
const kRed = Color(0x6E0E0A);
const kOrange = Color(0xF7996E);

// Useful
var icon = Image.asset('assets/images/icon.png');

// Pixel Values
const double kDefaultButtonWidth = 350.0;
const double kDefaultTextFieldWidth = 375.0;
const kDefaultButtonBorderRadius = 30.0;
const kVerticalPadding = 16.0;

// Other Reused Items
// var kAppBar = AppBar(
//   backgroundColor: kGreen,
//   leading: Hero(
//     tag: 'logo',
//     child: logo,
//   ),
//   title: Text(
//     'Friends Takeout',
//     style: TextStyle(
//       fontFamily: 'Audiowide',
//     ),
//   ),
// );

const kInputFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);