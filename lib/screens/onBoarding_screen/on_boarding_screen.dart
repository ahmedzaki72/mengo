import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/helper/cached_helper.dart';
import 'package:mengo/screens/login_screen/login_screen.dart';
import 'package:mengo/widgets/custom_container_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/widgets/custom_onboard_languages.dart';
import 'package:mengo/widgets/custom_welcome_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = "onBoarding_screen";

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int current_page = 0;
  final _pageViewController = PageController(initialPage: 0);
  bool turnOn = false;

  List<Map<String, dynamic>> welcomeList = [
    {
      'id': 1,
      "image": "assets/images/logo.png",
      "image_content": "assets/images/1.png",
      "text": "Create an app in minutes",
      "text_ar": "انشاء تطبيقك فى دقائق",
    },
    {
      'id': 2,
      "image": "assets/images/logo.png",
      "image_content": "assets/images/2.png",
      "text": "Without software experience",
      "text_ar": "بدون خبره برمجيه",
    },
    {
      'id': 1,
      "image": "assets/images/logo.png",
      "image_content": "assets/images/1.png",
      "text": "Make money from your phone",
      "text_ar": "اكسب المال من هاتفك",
    },
  ];

  Container buildDot({int index}) {
    return Container(
      margin: EdgeInsets.only(right: 15.h, left: 15.h),
      width: 15.w,
      height: 15.h,
      decoration: BoxDecoration(
        color: current_page == index ? red_color : point_color,
        shape: BoxShape.circle,
        border: Border.all(color: border_point),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: customContainerBackground(
            image: 'assets/images/Splash screen56.png',
            context: context,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: customOnBoardingLanguages(context: context),
                    ),
                  ),
                  Container(
                    height: 500.h,
                    child: PageView.builder(
                        controller: _pageViewController,
                        onPageChanged: (index) {
                          print(index);
                          setState(() {
                            current_page = index;
                          });
                        },
                        itemCount: welcomeList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return customWelcomeWidget(
                            context: context,
                            logo: welcomeList[index]['image'],
                            image: welcomeList[index]['image_content'],
                            text: translator.currentLanguage == 'ar'
                                ? welcomeList[index]['text_ar']
                                : welcomeList[index]['text'],
                          );
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      welcomeList.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (current_page == 0) {
                        setState(() {
                          _pageViewController
                              .jumpToPage(_pageViewController.page.round() + 1);
                        });
                      } else if (current_page == 1) {
                        setState(() {
                          _pageViewController
                              .jumpToPage(_pageViewController.page.round() + 1);
                        });
                      } else if (current_page == 2) {
                        setState(() {
                          turnOn = true;
                          CacheHelper.putBoolData(key: "turnOn", value: turnOn);
                        });
                        Navigator.of(context).pushNamed(LoginScreen.routeName);
                      }
                    },
                    child: Container(
                      width: 170.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: red_color,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Center(
                        child: Text(
                          'Get started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
