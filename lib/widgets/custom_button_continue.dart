import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/constants.dart';

Widget customButtonContinue({
  BuildContext context,
  String title,
  Function function
}) {
  return GestureDetector(
    onTap: function,
    child: Container(
      width: 170.w,
      height: 50.h,
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
