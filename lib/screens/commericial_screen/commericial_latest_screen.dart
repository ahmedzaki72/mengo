import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/screens/commericial_screen/commericial_footer_screen.dart';
import 'package:mengo/screens/commericial_screen/cubit/commercial_cubit.dart';
import 'package:mengo/screens/commericial_screen/cubit/commercial_states.dart';
import 'package:mengo/widgets/custom_button_theme.dart';
import 'package:mengo/widgets/custom_circle_colors.dart';
import 'package:mengo/widgets/custom_container_background.dart';
import 'package:mengo/widgets/custom_cotainer_shadow.dart';
import 'package:mengo/widgets/custom_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/widgets/custom_images_upload.dart';
import 'package:mengo/widgets/custom_show_dialog.dart';
import 'package:mengo/widgets/cutom_text_form.dart';
import 'package:toast/toast.dart';

class CommericialLatestScreen extends StatefulWidget {
  static const String routeName = "CommericialLatestScreen";

  @override
  _CommericialLatestScreenState createState() =>
      _CommericialLatestScreenState();
}

class _CommericialLatestScreenState extends State<CommericialLatestScreen> {
  String text1, text2;
  Color titleColor = Color(0xffd98025);
  Color textColor = Color(0xffd98025);
  File image1;
  File image2;

  final picker = ImagePicker();

  Future getImages() async {
    final pickerFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickerFile != null) {
        image1 = File(pickerFile.path);
      } else {
        Toast.show(
          'no_images_select',
          context,
          duration: Toast.LENGTH_SHORT,
          gravity: Toast.BOTTOM,
        );
      }
    });
  }

  Future getImages1() async {
    final pickerFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickerFile != null) {
        image2 = File(pickerFile.path);
      } else {
        Toast.show(
          'no_images_select',
          context,
          duration: Toast.LENGTH_SHORT,
          gravity: Toast.BOTTOM,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: customContainerBackground(
        context: context,
        image: 'assets/images/bg.jpeg',
        child: SafeArea(
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Text(
                          'Commercial Latest',
                          style: TextStyle(color: dark_red, fontSize: 16.sp),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Text1',
                        onChanged: (value) {
                          text1 = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Text2',
                        onChanged: (value) {
                          text2 = value;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          customImage(
                            name: 'Image1',
                            image: image1,
                            onTap: getImages,
                          ),
                          customImage(
                            name: 'Image2',
                            image: image2,
                            onTap: getImages1,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          customCircleColor(
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    pickerColor: titleColor,
                                    onChangeColor: (value) {
                                      setState(() {
                                        titleColor = value;
                                      });
                                    });
                              },
                              color: titleColor,
                              name: 'TitleColor'),
                          customCircleColor(
                              name: 'TextColor',
                              color: textColor,
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    pickerColor: textColor,
                                    onChangeColor: (value) {
                                      setState(() {
                                        textColor = value;
                                      });
                                    });
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      BlocConsumer<CommercialCubit, CommercialStates>(
                        listener: (context, states) {
                          if (states is CommercialLatestSuccessStates) {
                            if (states.commercialLatest.commercialResponse
                                    .status ==
                                '200') {
                              Navigator.pushNamed(
                                  context, CommericialFooterScreen.routeName);
                            }
                          }
                        },
                        builder: (context, states) {
                          var cubit = CommercialCubit.get(context);
                          if (states is! CommercialLatestLoadingStates) {
                            return customButtonTheme(
                                context: context,
                                title: "Save",
                                function: () {
                                  cubit.addingCommercialLatest(
                                    text1: text1,
                                    text2: text2,
                                    textColor: textColor.toString(),
                                    titleColor: titleColor.toString(),
                                    image1: image1,
                                    image2: image2,
                                  );
                                });
                          } else {
                            return spinKit;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        )),
      ),
    );
  }
}
