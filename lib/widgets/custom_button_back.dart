import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/constants.dart';

Widget customButtonBack({BuildContext context,}) {
  return GestureDetector(
    onTap: (){
      Navigator.of(context).pop();
    },
    child: Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15.0.r,
        ),
        color: Colors.white,
        border: Border.all(
          color: dark_red,
          width: 3.w,
        ),
      ),
      child: Center(
        child: Icon(Icons.arrow_back),
      ),
    ),
  );
}
