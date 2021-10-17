import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/constants.dart';

Widget customContainerShadow({
  BuildContext context,
  Widget child,
  double width,
  double height,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.r),
      border: Border.all(
        color: dark_red,
        width: 4.w,
      ),
      boxShadow: [
        BoxShadow(
          color: dark_red,
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: SingleChildScrollView(
      child: child,
    ),
  );
}
