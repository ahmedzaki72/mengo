import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customImage({
  File image,
  Function onTap,
  String name
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      child: Column(
        children: [
          Text(
            name,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          image == null
              ? ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image(
              width: 160.w,
              height: 100.h,
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWjhhuSVTGecEQDoLGPIA2yM0cJbe2c5xzF7kkg5lk-7tsRsdkE5zq_2G7r-Od14_8eS8&usqp=CAU',
              ),
            ),
          )
              : ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.file(
              image,
              width: 100.w,
              height: 100.h,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    ),
  );
}
