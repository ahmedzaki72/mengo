import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/cubit/theme_cubit.dart';
import 'package:mengo/cubit/theme_states.dart';
import 'package:mengo/helper/cached_helper.dart';
import 'package:mengo/screens/login_screen/cubit%20/login_cubit.dart';
import 'package:mengo/screens/login_screen/cubit%20/login_states.dart';
import 'package:mengo/screens/project_screen/project_screen.dart';
import 'package:mengo/screens/register_screen/register_screen.dart';
import 'package:mengo/widgets/custom_button_continue.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo/widgets/custom_container_background.dart';
import 'package:mengo/widgets/custom_form_field.dart';
import 'package:mengo/widgets/custom_social_login.dart';
import 'package:mengo/widgets/web_view.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login_screen";
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: customContainerBackground(
          context: context,
          image: 'assets/images/bg.jpeg',
          child: SingleChildScrollView(
            child: Form(
              key: _formState,
              child: BlocConsumer<LoginCubit, LoginStates>(
                listener: (context, states) {
                  if (states is LoginSuccessStates) {
                    if (states.loginModals.response.status == "200") {
                      CacheHelper.putStringData(key: 'id', value: states.loginModals.response.result.package_id);
                      CacheHelper.putStringData(
                              key: 'token',
                              value: states.loginModals.response.result.token)
                          .then((value) {
                        Navigator.popAndPushNamed(
                            context, ProjectScreen.routeName);
                      });
                    }
                  }
                  if(states is LoginErrorStates) {
                     if(states.error.toString() != null) {
                       Toast.show(
                         'Please check email or password',
                         context,
                         duration: Toast.LENGTH_SHORT,
                         gravity: Toast.BOTTOM,
                         backgroundColor: Colors.red,
                         textColor: Colors.white,
                       );
                     }
                  }
                },
                builder: (context, states) {
                  var cubit = LoginCubit.get(context);
                  return Container(
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage('assets/images/logo.png'),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Image(
                          image: AssetImage('assets/images/Capture3.png'),
                          width: 200.w,
                          height: 100.w,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomFromField(
                          hintText: translator.translate('email_signIn'),
                          validation: (value) {
                            if (value.isEmpty || !value.contains('@')) {
                              return "Please Enter your email or correct email";
                            }
                          },
                          saved: (value) {
                            email = value;
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomFromField(
                          hintText: translator.translate('password'),
                          security: true,
                          validation: (value) {
                            if (value.isEmpty || value.length < 4) {
                              return "Please Enter password or valid password ";
                            }
                          },
                          saved: (value) {
                            password = value;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        if (states is! LoginLoadingStates) ...[
                          customButtonContinue(
                              context: context,
                              title: translator.translate('signIn'),
                              function: () {
                                if (_formState.currentState.validate()) {
                                  _formState.currentState.save();
                                  cubit.login(email: email, password: password);
                                }
                              }),
                        ] else ...[
                          Container(
                            height: 50.h,
                            child: Center(child: spinKit),
                          ),
                        ],

                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("You don't have account ?"),
                            SizedBox(
                              width: 3,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(RegisterScreen.routeName);
                              },
                              child: Text(
                                "SignUp",
                                style: TextStyle(
                                  color: dark_red,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}


