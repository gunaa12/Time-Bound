// Imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_bound/constants.dart';
import 'package:time_bound/components/button.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 15, 20, 15),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Button(
              content: Icon(
                CupertinoIcons.arrow_left_circle,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 50,
              ),
              color: kBackgroundColor,
              onPress: (() {
                Navigator.pop(context);
              }),
              width: .1,
            ),
            Hero(
              tag: 'icon',
              child: CircleAvatar(
                radius: 25,
                backgroundColor: kBackgroundColor,
                backgroundImage: AssetImage(
                  'assets/images/icon.png',
                ),
              ),
            ),
          ]
      ),
    );
  }
}