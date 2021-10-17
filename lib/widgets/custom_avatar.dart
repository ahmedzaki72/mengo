import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mengo/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customAvatar({
  BuildContext context,
  File image,
  Function onTap,
  String images
}) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      CircleAvatar(
        radius: 50.r,
        backgroundColor: dark_red,
        child: CircleAvatar(
          radius: 47.r,
          backgroundImage: image == null
              ? NetworkImage(images)
              : FileImage(image),),
      ),
      Positioned(
        right: -10.w,
        bottom: 0.h,
        child: GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            backgroundColor: dark_red,
            radius: 20.r,
            child: CircleAvatar(
              radius: 18.r,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.add,
                color: dark_red,
                size: 30,
              ),
            ),
          ),
        ),
      )
    ],
  );
}
