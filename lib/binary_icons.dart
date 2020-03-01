import 'package:flutter/material.dart';
import 'constants.dart';

class BinaryWidget extends StatelessWidget {
  BinaryWidget({this.title, this.iconType});
  final String title;
  final IconData iconType;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Icon(
              iconType,
              size: kBinaryIconColumnHeight,
            ),
          ),
        ]
    );
  }
}