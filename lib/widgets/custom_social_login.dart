import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customSocialLogin({
  BuildContext context,
  Function googleFunction,
  Function faceFunction,
  Function twitterFunction,
}) {
  return Container(
    width: 200.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: googleFunction,
          child: Image(
            width: 40.w,
            height: 100.h,
            image: AssetImage(
              'assets/images/google.png',
            ),
          ),
        ),
        SizedBox(
          width: 12.0.w,
        ),
        GestureDetector(
          onTap: faceFunction,
          child: Image(
            width: 50.w,
            height: 100.h,
            image: AssetImage(
              'assets/images/facebook.png',
            ),
          ),
        ),
        GestureDetector(
          onTap: twitterFunction,
          child: Image(
            width: 75.w,
            height: 100.h,
            image: AssetImage(
              'assets/images/twitter.png',
            ),
          ),
        ),
      ],
    ),
  );
}
