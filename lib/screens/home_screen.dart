// Import
import 'package:flutter/material.dart';
import 'package:time_bound/constants.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home_screen_id";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: SafeArea(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(tag: 'icon', child: icon),

                ],
              ),
            ),
          )
      ),
    );
  }
}
