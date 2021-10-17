import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/screens/ecommerce_screen/cubit/ecommerce_cubit.dart';
import 'package:mengo/screens/ecommerce_screen/cubit/ecommerce_states.dart';
import 'package:mengo/screens/ecommerce_screen/ecommerce_offerProduct_screen.dart';
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

class ECommerceHomeScreen extends StatefulWidget {
  static const String routeName = "ecommerce_home_screen";

  @override
  _ECommerceHomeScreenState createState() => _ECommerceHomeScreenState();
}

class _ECommerceHomeScreenState extends State<ECommerceHomeScreen> {
  String siteName,
      categoryOne,
      categoryTwo,
      categoryThree,
      siteDescription,
      footerText,
      footerAddress,
      footerEmail;
  Color navBarColor = Color(0xffd98025);
  Color aboutTitleColors =Color(0xffd98025);
  Color categoryTitleColors = Color(0xffd98025);
  Color footerTitleColors = Color(0xffd98025);
  Color footerAddressColors = Color(0xffd98025);
  Color footerEmailColors = Color(0xffd98025);
  File categoryOneImage;
  File categoryTwoImage;
  File categoryThreeImage;
  File offerImage;
  File salesImage;
  File homeImage1;
  File homeImage2;
  File aboutImage;

  final picker = ImagePicker();

  Future getImagesCategory1() async {
    final pickerFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickerFile != null) {
        categoryOneImage = File(pickerFile.path);
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

  Future getImagesCategory2() async {
    final pickerFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickerFile != null) {
        categoryTwoImage = File(pickerFile.path);
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

  Future getImagesCategory3() async {
    final pickerFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickerFile != null) {
        categoryThreeImage = File(pickerFile.path);
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

  Future getImagesOffer() async {
    final pickerFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickerFile != null) {
        offerImage = File(pickerFile.path);
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

  Future getImagesSales() async {
    final pickerFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickerFile != null) {
        salesImage = File(pickerFile.path);
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

  Future getImagesHome1() async {
    final pickerFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickerFile != null) {
        homeImage1 = File(pickerFile.path);
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

  Future getImagesHome2() async {
    final pickerFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickerFile != null) {
        homeImage2 = File(pickerFile.path);
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

  Future getImagesAbout() async {
    final pickerFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickerFile != null) {
        aboutImage = File(pickerFile.path);
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
    print(categoryOneImage);
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
                          'E-Commerce Home',
                          style: TextStyle(color: dark_red, fontSize: 16.sp),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'SiteName',
                        onChanged: (value) {
                          siteName = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Category One',
                        onChanged: (value) {
                          categoryOne = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Category Two',
                        onChanged: (value) {
                          categoryTwo = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Category Three',
                        onChanged: (value) {
                          categoryThree = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Site Description',
                        onChanged: (value) {
                          siteDescription = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Footer Text',
                        onChanged: (value) {
                          footerText = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Footer Address',
                        onChanged: (value) {
                          footerAddress = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Footer Email',
                        onChanged: (value) {
                          footerEmail = value;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           customImage(
                             name: 'CatOneImage',
                             image: categoryOneImage,
                             onTap: getImagesCategory1,
                           ),
                          customImage(
                            name: 'CatTwoImage',
                            image: categoryTwoImage,
                            onTap: getImagesCategory2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          customImage(
                            name: 'CatThreeImage',
                            image: categoryThreeImage,
                            onTap: getImagesCategory3,
                          ),
                          customImage(
                            name: 'OfferImage',
                            image: offerImage,
                            onTap: getImagesOffer,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          customImage(
                            name: 'SalesImage',
                            image: salesImage,
                            onTap: getImagesSales,
                          ),
                          customImage(
                            name: 'Home1Image',
                            image: homeImage1,
                            onTap: getImagesHome1,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          customImage(
                            name: 'Home2Image',
                            image: homeImage2,
                            onTap: getImagesHome2,
                          ),
                          customImage(
                            name: 'AboutImage',
                            image: aboutImage,
                            onTap: getImagesAbout,
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
                                  pickerColor: navBarColor,
                                  onChangeColor: (value) {
                                    setState(() {
                                      navBarColor = value;
                                    });
                                  });
                            },
                            color: navBarColor,
                            name: 'NavBarColor',
                          ),
                          customCircleColor(
                              name: 'AboutColor',
                              color: aboutTitleColors,
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    pickerColor: aboutTitleColors,
                                    onChangeColor: (value) {
                                      setState(() {
                                        aboutTitleColors = value;
                                      });
                                    });
                              }),
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
                                  pickerColor: categoryTitleColors,
                                  onChangeColor: (value) {
                                    setState(() {
                                      categoryTitleColors = value;
                                    });
                                  });
                            },
                            color: categoryTitleColors,
                            name: 'CTitleColor',
                          ),
                          customCircleColor(
                              name: 'FTitleColor',
                              color: footerTitleColors,
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    pickerColor: footerTitleColors,
                                    onChangeColor: (value) {
                                      setState(() {
                                        footerTitleColors = value;
                                      });
                                    });
                              }),
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
                                  pickerColor: footerAddressColors,
                                  onChangeColor: (value) {
                                    setState(() {
                                      footerAddressColors = value;
                                    });
                                  });
                            },
                            color: footerAddressColors,
                            name: 'FAddressColors',
                          ),
                          customCircleColor(
                              name: 'FEmailColor',
                              color: footerEmailColors,
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    pickerColor: footerEmailColors,
                                    onChangeColor: (value) {
                                      setState(() {
                                        footerEmailColors = value;
                                      });
                                    });
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      BlocConsumer<ECommerceCubit, ECommerceStates>(
                        listener: (context, states) {
                          if (states is ECommerceHomeSuccessStates) {
                            if (states
                                    .eCommerceHome.commercialResponse.status ==
                                '200') {
                              Navigator.pushNamed(context,
                                  ECommerceOfferProductScreen.routeName);
                            }
                          }
                        },
                        builder: (context, states) {
                          var cubit = ECommerceCubit.get(context);
                          if (states is! ECommerceHomeLoadingStates) {
                            return customButtonTheme(
                                context: context,
                                title: "Save",
                                function: () {
                                  cubit.addingHomeECommerce(
                                    siteName: siteName,
                                    salesImage: salesImage,
                                    siteDescription: siteDescription,
                                    navBarColor: navBarColor.toString(),
                                    categoryOne: categoryOne,
                                    categoryTwo: categoryTwo,
                                    categoryThree: categoryThree,
                                    categoryOneImage: categoryOneImage,
                                    categoryThreeImage: categoryThreeImage,
                                    categoryTwoImage: categoryTwoImage,
                                    catigoriesTitleColor:
                                        categoryTitleColors.toString(),
                                    footerAddress: footerAddress,
                                    footerEmail: footerEmail,
                                    footerAddressColor:
                                        footerAddressColors.toString(),
                                    footerEmailColor:
                                        footerEmailColors.toString(),
                                    footerText: footerText,
                                    footerTitleColors:
                                        footerTitleColors.toString(),
                                    offerImage: offerImage,
                                    homeImage1: homeImage1,
                                    homeImage2: homeImage2,
                                    aboutImage: aboutImage,
                                    aboutTitleColor:
                                        aboutTitleColors.toString(),
                                  );
                                });
                          } else {
                            return spinKit;
                          }
                        },
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
