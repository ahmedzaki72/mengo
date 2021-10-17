import 'package:flutter/material.dart';
import 'package:mengo/constants.dart';

Widget customContainerTheme({
  BuildContext context,
  double width,
  double height,
  double radius,
  Widget child,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: Colors.white,
      border: Border.all(
        color: dark_red,
        width: 4,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: child,
  );
}
