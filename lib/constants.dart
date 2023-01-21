// Imports
import 'dart:ui';
import 'package:flutter/material.dart';

// Colors
const Color kEmerald = Color(0xff1E9A67);
const Color kTangerine = Color(0xFFf7996e);
const Color kOrange = Color(0xFFD58936);
const Color kRed = Color(0xffB34A46);
const Color kPurple = Color(0xFF712f79);
const Color kBackgroundColor = Color(0xFF121212);

// Useful
var icon = Image.asset('assets/images/icon.png');

// Pixel Values
const double kDefaultButtonWidth = 350.0;
const double kDefaultTextFieldWidth = 375.0;
const kDefaultButtonBorderRadius = 30.0;
const kVerticalPadding = 16.0;

// Other Reused Items
const loginStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400);

const registerStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold
);

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