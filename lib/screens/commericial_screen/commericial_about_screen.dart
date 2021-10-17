import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/screens/commericial_screen/commericial_service_screen.dart';
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

class CommericialAboutScreen extends StatefulWidget {
  static const String routeName = "Commericial_about_screen";

  @override
  _CommericialAboutScreenState createState() => _CommericialAboutScreenState();
}

class _CommericialAboutScreenState extends State<CommericialAboutScreen> {
  Color backgroundColor = Color(0xffd98025);
  Color titleColor = Color(0xffd98025);
  Color textColor = Color(0xffd98025);
  File image;
  String text;

  final picker = ImagePicker();

  Future getImages() async {
    final pickerFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickerFile != null) {
        image = File(pickerFile.path);
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
                          'Commercial About',
                          style: TextStyle(color: dark_red, fontSize: 16.sp),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: CustomTextFormField(
                          hintText: 'Text',
                          onChanged: (value) {
                            text = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      customImage(
                        name: 'CategoryOne',
                        onTap: getImages,
                        image: image,
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
                                    pickerColor: backgroundColor,
                                    onChangeColor: (value) {
                                      setState(() {
                                        backgroundColor = value;
                                      });
                                    });
                              },
                              color: backgroundColor,
                              name: 'BackgroundColor'),
                          customCircleColor(
                              name: 'TitleColor',
                              color: titleColor,
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    pickerColor: titleColor,
                                    onChangeColor: (value) {
                                      setState(() {
                                        titleColor = value;
                                      });
                                    });
                              }),
                        ],
                      ),
                      customCircleColor(color: textColor, name: 'TextColor', onTap: (){
                        showAlertDialog(
                            context: context,
                            pickerColor: textColor,
                            onChangeColor: (value) {
                              setState(() {
                                textColor = value;
                              });
                            });
                      }),
                      SizedBox(
                        height: 30.h,
                      ),
                      BlocConsumer<CommercialCubit, CommercialStates>(
                        listener: (context, states) {
                          if (states is CommercialSuccessAboutStates) {
                            if (states.commercialAboutModals.commercialResponse
                                    .status ==
                                '200') {
                              Navigator.of(context).pushNamed(
                                  CommericialServiceScreen.routeName);
                            }
                          }
                        },
                        builder: (context, states) {
                          var cubit = CommercialCubit.get(context);
                          if (states is! CommercialLoadingAboutStates) {
                            return customButtonTheme(
                                context: context,
                                title: "Save",
                                function: () {
                                  cubit.addingCommercialAbout(
                                    backgroundColor: backgroundColor.toString(),
                                    titleColor: titleColor.toString(),
                                    textColor: textColor.toString(),
                                    text: text,
                                    image: image,
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
