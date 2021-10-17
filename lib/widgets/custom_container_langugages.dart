import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customContainerLanguages({
  BuildContext context,
  Color color,
  String title,
  Color color1,
  Function function,
}) {
  return Padding(
    padding: EdgeInsets.all(2.w),
    child: GestureDetector(
      onTap: function,
      child: Container(
        width: 105.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 22.sp,
              color: color1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}
