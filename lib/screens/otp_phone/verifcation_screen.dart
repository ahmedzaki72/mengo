// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:localize_and_translate/localize_and_translate.dart';
// import 'package:mengo/constants.dart';
// import 'package:mengo/screens/profile_screen/profile_screen.dart';
// import 'package:mengo/screens/project_screen/project_screen.dart';
// import 'package:mengo/widgets/custom_button_continue.dart';
// import 'package:mengo/widgets/custom_container_background.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
//
// class VerificationScreen extends StatelessWidget {
//   static const String routeName = 'verification_screen';
//
//   @override
//   Widget build(BuildContext context) {
//     final number = ModalRoute.of(context).settings.arguments;
//     return Scaffold(
//       body: SafeArea(
//         child: customContainerBackground(
//           context: context,
//           image: 'assets/images/bg.jpeg',
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Image(
//                   image: AssetImage('assets/images/logo.png'),
//                   width: 200.w,
//                   height: 100.w,
//                 ),
//                 SizedBox(
//                   height: 30.h,
//                 ),
//                 Text(
//                   translator.translate('confirm_code'),
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 30.sp,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15.h,
//                 ),
//                 Text(
//                   translator.translate('confirm_text'),
//                   style: TextStyle(
//                     fontSize: 15.sp,
//                     color: input_color,
//                   ),
//                 ),
//                 Text(
//                   number,
//                   style: TextStyle(
//                     fontSize: 15.sp,
//                     color: input_color,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 Container(
//                   width: 250.w,
//                   child: PinCodeTextField(
//                       length: 4,
//                       obscureText: false,
//                       keyboardType: TextInputType.number,
//                       pinTheme: PinTheme(
//                         shape: PinCodeFieldShape.circle,
//                         fieldHeight: 100,
//                         fieldWidth: 60,
//                         activeFillColor: Colors.white,
//                       ),
//                       onChanged: (result) {
//                         print(result);
//                       }),
//                 ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 customButtonContinue(
//                     context: context,
//                     title: translator.translate('confirm_now'),
//                     function: () {
//                       Navigator.of(context).pushNamed(ProjectScreen.routeName);
//                     }),
//                 SizedBox(
//                   height: 40.h,
//                 ),
//                 Text(
//                   '01.24',
//                   style: TextStyle(
//                     color: dark_red,
//                     fontSize: 17.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     print('resending again');
//                   },
//                   child: Text(
//                     translator.translate('resend_again'),
//                     style: TextStyle(
//                       color: dark_red,
//                       fontSize: 20.sp,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
