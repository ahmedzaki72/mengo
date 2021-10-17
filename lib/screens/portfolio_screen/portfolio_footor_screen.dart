import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/screens/portfolio_screen/cubit/portfolio_cubit.dart';
import 'package:mengo/screens/portfolio_screen/cubit/portfolio_states.dart';
import 'package:mengo/screens/project_screen/create_apk_screen.dart';
import 'package:mengo/widgets/custom_button_theme.dart';
import 'package:mengo/widgets/custom_circle_colors.dart';
import 'package:mengo/widgets/custom_container_background.dart';
import 'package:mengo/widgets/custom_cotainer_shadow.dart';
import 'package:mengo/widgets/custom_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/widgets/custom_show_dialog.dart';
import 'package:mengo/widgets/cutom_text_form.dart';

class PortfolioFooterScreen extends StatefulWidget {
  static const String routeName = "portfolio_footer_screen";

  @override
  _PortfolioFooterScreenState createState() => _PortfolioFooterScreenState();
}

class _PortfolioFooterScreenState extends State<PortfolioFooterScreen> {
  String name, address, email, footerBody;
  Color footerBodyColor = Color(0xffd98025);
  Color addressColor = Color(0xffd98025);
  Color nameColor = Color(0xffd98025);
  Color emailColor = Color(0xffd98025);

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
                child: SafeArea(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Text(
                          'Portfolio Footer',
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
                        hintText: 'footerBody',
                        onChanged: (value) {
                          footerBody = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Address',
                        onChanged: (value) {
                          address = value;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Email',
                        onChanged: (value) {
                          email = value;
                        },
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
                                    pickerColor: nameColor,
                                    onChangeColor: (value) {
                                      setState(() {
                                        nameColor = value;
                                      });
                                    });
                              },
                              color: nameColor,
                              name: 'NameColors'),
                          customCircleColor(
                              name: 'AddressColor',
                              color: addressColor,
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    pickerColor: addressColor,
                                    onChangeColor: (value) {
                                      setState(() {
                                        addressColor = value;
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
                                  pickerColor: emailColor,
                                  onChangeColor: (value) {
                                    setState(() {
                                      emailColor = value;
                                    });
                                  });
                            },
                            color: emailColor,
                            name: 'EmailColor',
                          ),
                          customCircleColor(
                              name: 'FooterBody',
                              color: footerBodyColor,
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    pickerColor: footerBodyColor,
                                    onChangeColor: (value) {
                                      setState(() {
                                        footerBodyColor = value;
                                      });
                                    });
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      BlocConsumer<PortfolioCubit, PortfolioStates>(
                        listener: (context, states) {
                          if (states is PortfolioSuccessFooterStates) {
                            if (states
                                    .portfolioFooter.portfolioResponse.status ==
                                "200") {
                              Navigator.popAndPushNamed(
                                  context, CreateApkScreen.routeName);
                            }
                          }
                        },
                        builder: (context, states) {
                          var cubit = PortfolioCubit.get(context);
                          if (states is! PortfolioLoadingFooterStates) {
                            return customButtonTheme(
                                context: context,
                                title: "Save",
                                function: () {
                                  cubit.addingFooterPortfolio(
                                    name: name,
                                    email: email,
                                    emailColor: emailColor.toString(),
                                    address: address,
                                    footerBody: footerBody,
                                    addressColor: addressColor.toString(),
                                    nameColor: nameColor.toString(),
                                    footerBodyColor: footerBodyColor.toString(),
                                  );
                                });
                          } else {
                            return spinKit;
                          }
                        },
                      ),
                      SizedBox(
                        height: 30.h,
                      )
                    ],
                  ),
                )),
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
