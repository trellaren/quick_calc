import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colorProp, this.cardChild, this.onPressed});
  final Color colorProp;
  final Widget cardChild;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.fromLTRB(3.0, 10.0, 3.0, 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          color: colorProp,
        ),
      ),
    );
  }
}

