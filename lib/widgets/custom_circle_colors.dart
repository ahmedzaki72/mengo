import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/constants.dart';

Widget customCircleColor({
  Color color,
  Function onTap,
  String name,
}) {
  print(color);
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Text(
          name,
          overflow: TextOverflow.fade,
          style: TextStyle(
            color: color,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: dark_red,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 30.r,
            backgroundColor: color,
          ),
        ),
      ],
    ),
  );
}
