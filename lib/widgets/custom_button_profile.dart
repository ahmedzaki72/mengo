import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/constants.dart';

Widget customButtonProfile({
  BuildContext context,
  Function function,
  String title,
}) {
  return GestureDetector(
    onTap: function,
    child: Container(
      width: 220.w,
      height: 35.h,
      decoration: BoxDecoration(
        color: dark_red,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
