import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/screens/project_screen/create_apk_screen.dart';
import 'package:mengo/widgets/check_direction.dart';
import 'package:mengo/widgets/custom_button_theme.dart';
import 'package:mengo/widgets/custom_container_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/widgets/custom_container_theme.dart';
import 'package:mengo/widgets/custom_cotainer_shadow.dart';
import 'package:mengo/widgets/custom_header.dart';
import 'package:mengo/widgets/custom_show_dialog.dart';

class AddingColorScreen extends StatefulWidget {
  static const String routeName = "adding_color_screen";

  @override
  _AddingColorScreenState createState() => _AddingColorScreenState();
}

class _AddingColorScreenState extends State<AddingColorScreen> {
  Color appBarColor = Colors.black26;
  Color bodyBackground = Colors.white;
  Color floatingButton = Colors.red;
  Color buttonBar = Colors.amberAccent;
  Color buttonColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    print("this is colors $appBarColor");
    return Scaffold(
      body: SafeArea(
        child: customContainerBackground(
          context: context,
          image: 'assets/images/bg.jpeg',
          child: SingleChildScrollView(
            child: Column(
              children: [
                customHeader(context: context),
                Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 200.w,
                  height: 100.w,
                ),
                SizedBox(
                  height: 40.h,
                ),
                customContainerShadow(
                  context: context,
                  width: 330.w,
                  height: 500.h,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        translator.translate('add_page'),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.sp,
                          color: dark_red,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          customButtonTheme(
                            context: context,
                            title: "theme",
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          customContainerTheme(
                            child: Container(
                              padding: checkDirection(EdgeInsets.only(right: 30.w), EdgeInsets.only(left: 30.w)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showAlertDialog(
                                        context: context,
                                        pickerColor: appBarColor,
                                        onChangeColor: (value) {
                                         setState(() {
                                           appBarColor = value;
                                         });
                                        }
                                      );
                                    },
                                    child: Text(
                                      'App Bar Color',
                                      style: TextStyle(
                                        color: dark_red,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showAlertDialog(
                                          context: context,
                                          pickerColor: bodyBackground,
                                          onChangeColor: (value) {
                                            setState(() {
                                              bodyBackground = value;
                                            });
                                          }
                                      );
                                    },
                                    child: Text(
                                      'Body Background',
                                      style: TextStyle(
                                        color: dark_red,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showAlertDialog(
                                          context: context,
                                          pickerColor: floatingButton,
                                          onChangeColor: (value) {
                                            setState(() {
                                              floatingButton = value;
                                            });
                                          }
                                      );
                                    },
                                    child: Text(
                                      'Floating Button',
                                      style: TextStyle(
                                        color: dark_red,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showAlertDialog(
                                          context: context,
                                          pickerColor: buttonBar,
                                          onChangeColor: (value) {
                                            setState(() {
                                              buttonBar = value;
                                            });
                                          }
                                      );
                                    },
                                    child: Text(
                                      'Button Bar',
                                      style: TextStyle(
                                        color: dark_red,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            context: context,
                            width: 210.w,
                            height: 150.h,
                            radius: 40.r,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          customButtonTheme(
                            context: context,
                            title: "buttons",
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          customContainerTheme(
                              context: context,
                              width: 210.w,
                              height: 100.h,
                              radius: 40.r,
                              child: Container(
                                padding: checkDirection(EdgeInsets.only(right: 30.w), EdgeInsets.only(left: 30.w)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showAlertDialog(
                                            context: context,
                                            pickerColor: buttonColor,
                                            onChangeColor: (value) {
                                              setState(() {
                                                buttonColor = value;
                                              });
                                            }
                                        );
                                      },
                                      child: Text(
                                        translator.translate('button_color'),
                                        style: TextStyle(
                                          color: dark_red,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        translator.translate('button_shape'),
                                        style: TextStyle(
                                          color: dark_red,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 10.h,
                          ),
                          customButtonTheme(
                              context: context,
                              title: "add_image",
                              function: () {
                                print('images');
                              }),
                          SizedBox(
                            height: 10.h,
                          ),
                          customButtonTheme(
                              context: context,
                              title: "add_text",
                              function: () {
                                print('add text');
                              }),
                          SizedBox(
                            height: 10.h,
                          ),
                          customButtonTheme(
                              context: context,
                              title: "add_video",
                              function: () {
                                print('video');
                              }),
                          SizedBox(
                            height: 10.h,
                          ),
                          customButtonTheme(
                              context: context,
                              title: "add_audio",
                              function: () {
                                print('audio');
                              }),
                          SizedBox(
                            height: 20.h,
                          ),
                          customButtonTheme(
                              context: context,
                              title: "save",
                              function: () {
                                Navigator.of(context).pushNamed(CreateApkScreen.routeName);
                              }),
                          SizedBox(
                            height: 30.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
