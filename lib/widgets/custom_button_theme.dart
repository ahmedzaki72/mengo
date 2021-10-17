import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:mengo/constants.dart';

Widget customButtonTheme({
  BuildContext context,
  String title,
  Function function,
}) {
  return GestureDetector(
    onTap: function,
    child: Container(
      width: 200.w,
      height: 30.h,
      decoration: BoxDecoration(
        color: dark_red,
        borderRadius: BorderRadius.circular(15.0.r),
      ),
      child: Center(
        child: Text(
          translator.translate(title),
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}
