import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customWelcomeWidget({
  BuildContext context,
  String logo,
  String image,
  String text,
}) {
  return Column(
    children: [
      Image(
        image: AssetImage(logo),
        width: 200.w,
        height: 100.w,
      ),
      SizedBox(
        height: 20.h,
      ),
      Image(
        image: AssetImage(image),
      ),
      SizedBox(
        height: 20.h,
      ),
      Text(
        text,
        style: TextStyle(
          fontSize: 25.0.sp,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
