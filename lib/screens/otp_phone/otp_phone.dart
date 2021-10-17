// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:localize_and_translate/localize_and_translate.dart';
// import 'package:mengo/constants.dart';
// import 'package:mengo/screens/otp_phone/verifcation_screen.dart';
// import 'package:mengo/widgets/custom_button_continue.dart';
// import 'package:mengo/widgets/custom_container_background.dart';
// import 'package:mengo/widgets/custom_container_number.dart';
// import 'package:mengo/widgets/custom_form_field.dart';
//
// class OtpPhone extends StatefulWidget {
//   static const String routeName = "otp_phone";
//
//   @override
//   _OtpPhoneState createState() => _OtpPhoneState();
// }
//
// class _OtpPhoneState extends State<OtpPhone> {
//   String countryCode = '+20';
//   String number;
//
//   @override
//   Widget build(BuildContext context) {
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
//                   height: 40.h,
//                 ),
//                 Text(
//                   translator.translate('registration'),
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
//                   translator.translate('text_number'),
//                   style: TextStyle(
//                     color: input_color,
//                     fontSize: 14,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30.h,
//                 ),
//                 Stack(
//                   children: [
//                     CustomFromField(
//                       hintText: translator.translate('text_form'),
//                       onChanged: (value) {
//                         number = value;
//                       },
//                     ),
//                     Positioned(
//                       child: customContainerNumber(
//                         context: context,
//                         country: CountryCodePicker(
//                           onChanged: (country) {
//                             String countrys = country.toString();
//                             setState(() {
//                               countryCode = countrys;
//                             });
//                           },
//                           initialSelection: "EG",
//                           flagWidth: 20,
//                           favorite: ["+20", "EG"],
//                           showFlagMain: false,
//                           padding: EdgeInsets.all(0),
//                           textStyle:
//                               TextStyle(color: Colors.white, fontSize: 12.sp),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 40.h,
//                 ),
//                 customButtonContinue(
//                   function: () {
//                     Navigator.of(context).pushNamed(
//                         VerificationScreen.routeName,
//                         arguments: countryCode + number);
//                   },
//                   context: context,
//                   title: translator.translate('continue'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
