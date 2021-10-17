import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/widgets/check_direction.dart';

Widget customRowSubScribe({
  BuildContext context,
  String title,
}) {
  return Padding(
    padding: checkDirection(
      EdgeInsets.only(right: 10.w),
      EdgeInsets.only(left: 10.w),
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: 12.r,
          backgroundColor: dark_red,
        ),
        SizedBox(
          width: 12.0.w,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 20.0),
        ),
      ],
    ),
  );
}
