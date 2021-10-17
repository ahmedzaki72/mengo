import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/screens/ecommerce_screen/cubit/ecommerce_cubit.dart';
import 'package:mengo/screens/ecommerce_screen/cubit/ecommerce_states.dart';
import 'package:mengo/screens/ecommerce_screen/ecommerce_categoryThree_screen.dart';
import 'package:mengo/widgets/custom_button_theme.dart';
import 'package:mengo/widgets/custom_container_background.dart';
import 'package:mengo/widgets/custom_cotainer_shadow.dart';
import 'package:mengo/widgets/custom_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/widgets/custom_images_upload.dart';
import 'package:mengo/widgets/custom_show_dialog.dart';
import 'package:mengo/widgets/cutom_text_form.dart';
import 'package:toast/toast.dart';

class ECommerceCategoryTwoScreen extends StatefulWidget {
  static const String routeName = "ecommerce_Category_two_screen";

  @override
  _ECommerceCategoryTwoScreenState createState() =>
      _ECommerceCategoryTwoScreenState();
}

class _ECommerceCategoryTwoScreenState
    extends State<ECommerceCategoryTwoScreen> {
  File image;
  String name;
  String price;

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
                          'E-Commerce CategoryTwo',
                          style: TextStyle(color: dark_red, fontSize: 16.sp),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Name',
                        onChanged: (value) {
                          name = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Price',
                        onChanged: (value) {
                          price = value;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      customImage(
                        name: 'UploadImage',
                        image: image,
                        onTap: getImages,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      BlocConsumer<ECommerceCubit, ECommerceStates>(
                        listener: (context, states) {
                          if (states is ECommerceCategoryTwoSuccessStates) {
                            if (states.eCommerceCategoryTwo.commercialResponse
                                    .status ==
                                '200') {
                              Navigator.pushNamed(context,
                                  ECommerceCategoryThreeScreen.routeName);
                            }
                          }
                        },
                        builder: (context, states) {
                          var cubit = ECommerceCubit.get(context);
                          if(states is! ECommerceCategoryTwoLoadingStates) {
                            return customButtonTheme(
                                context: context,
                                title: "Save",
                                function: () {
                                  cubit.addingECommerceCategoryTwo(
                                    name: name,
                                    image: image,
                                    price: price,
                                  );
                                });
                          } else {
                            return spinKit;
                          }

                        },
                      )
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
