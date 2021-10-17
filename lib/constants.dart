import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mengo/helper/cached_helper.dart';

const Color dark_red = Color(0xFFC0442C);
const Color input_color = Color(0xFFFFF2F2);
const Color bg_color = Color(0xFFF89A36);
const Color input_border_color = Color(0xFFA8A6A5);
const Color text_project = Color(0xFF70593A);
const Color picker_color = Color(0xFF0d1242);
const Color point_color = Color(0xFFDAE2E5);
const Color red_color = Color(0xFFEB423B);
const Color lan_color = Color(0xFFF5EDED);
const Color border_point = Color(0xFF707070);


/// make login generate to all app


String id="";
bool turnOn;
String token = "";

String tokens = CacheHelper.getStringData(key: 'token');
String ids = CacheHelper.getStringData(key: 'id');


/// custom loading
const spinKit = SpinKitFadingCircle(
  color: dark_red,
  size: 40,
);