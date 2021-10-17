import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/constants.dart';

Widget customContainerProject({
  BuildContext context,
  double widthContainer,
  double heightContainer,
  double widthLine,
  double heightLine,
  Widget child,
  String title,
  Color color,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return Container(
    child: Column(
      children: [
        Container(
          width: widthContainer,
          height: heightContainer,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: dark_red, width: 4.w),
            borderRadius: BorderRadius.circular(40.r),
            boxShadow: [
              BoxShadow(
                color: dark_red,
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: child,
        ),
        // SizedBox(
        //   height: 20.h,
        // ),
        // Text(
        //   title,
        //   style: TextStyle(
        //     fontSize: 20.sp,
        //     fontWeight: fontWeight,
        //     color: color
        //   ),
        // ),
        // SizedBox(
        //   height: 5.h,
        // ),
        // Container(
        //   width: widthLine,
        //   height: heightLine,
        //   color: input_border_color,
        // ),
      ],
    ),
  );
}
