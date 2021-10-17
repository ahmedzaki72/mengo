import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:mengo/constants.dart';
import 'package:mengo/cubit/theme_cubit.dart';
import 'package:mengo/cubit/theme_states.dart';
import 'package:mengo/helper/cached_helper.dart';
import 'package:mengo/helper/dio_helper.dart';
import 'package:mengo/screens/about_screen/about_screen.dart';
import 'package:mengo/screens/commericial_screen/commericial_about_screen.dart';
import 'package:mengo/screens/commericial_screen/commericial_footer_screen.dart';
import 'package:mengo/screens/commericial_screen/commericial_latest_screen.dart';
import 'package:mengo/screens/commericial_screen/commericial_project_screen.dart';
import 'package:mengo/screens/commericial_screen/commericial_service_screen.dart';
import 'package:mengo/screens/commericial_screen/commericial_single_project_screen.dart';
import 'package:mengo/screens/commericial_screen/commericial_single_service_screen.dart';
import 'package:mengo/screens/commericial_screen/commericial_start_screen.dart';
import 'package:mengo/screens/commericial_screen/cubit/commercial_cubit.dart';
import 'package:mengo/screens/ecommerce_screen/cubit/ecommerce_cubit.dart';
import 'package:mengo/screens/ecommerce_screen/ecommerce_categoryOne_screen.dart';
import 'package:mengo/screens/ecommerce_screen/ecommerce_categoryThree_screen.dart';
import 'package:mengo/screens/ecommerce_screen/ecommerce_categoryTwo_screen.dart';
import 'package:mengo/screens/ecommerce_screen/ecommerce_home_screen.dart';
import 'package:mengo/screens/ecommerce_screen/ecommerce_offerProduct_screen.dart';
import 'package:mengo/screens/ecommerce_screen/ecommerce_salesProduct_screen.dart';
import 'package:mengo/screens/login_screen/cubit%20/login_cubit.dart';
import 'package:mengo/screens/login_screen/login_screen.dart';
import 'package:mengo/screens/onBoarding_screen/on_boarding_screen.dart';
import 'package:mengo/screens/package_screen/package_screen.dart';
import 'package:mengo/screens/portfolio_screen/cubit/portfolio_cubit.dart';
import 'package:mengo/screens/portfolio_screen/portfolio_about_screen.dart';
import 'package:mengo/screens/portfolio_screen/portfolio_experience_screen.dart';
import 'package:mengo/screens/portfolio_screen/portfolio_footor_screen.dart';
import 'package:mengo/screens/portfolio_screen/portfolio_project_screen.dart';
import 'package:mengo/screens/portfolio_screen/portfolio_skill_screen.dart';
import 'package:mengo/screens/portfolio_screen/portfolio_start_screen.dart';
import 'package:mengo/screens/profile_screen/cubit/profile_cubit.dart';
import 'package:mengo/screens/profile_screen/profile_screen.dart';
import 'package:mengo/screens/project_screen/add_color_screen.dart';
import 'package:mengo/screens/project_screen/create_apk_screen.dart';
import 'package:mengo/screens/project_screen/cubit/new_project_cubit.dart';
import 'package:mengo/screens/project_screen/cubit/project_cubit.dart';
import 'package:mengo/screens/project_screen/newProject_screen.dart';
import 'package:mengo/screens/project_screen/project_screen.dart';
import 'package:mengo/screens/register_screen/cubit/register_cubit.dart';
import 'package:mengo/screens/register_screen/register_screen.dart';
import 'package:mengo/screens/splah_screen/splash_screen.dart';
import 'package:mengo/screens/subscribe_screen/cubit/package_cubit.dart';
import 'package:mengo/screens/subscribe_screen/subscribe_detail_screen.dart';
import 'package:mengo/screens/subscribe_screen/subscribe_screen.dart';
import 'package:mengo/widgets/web_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  id = CacheHelper.getStringData(key: 'id');
  turnOn = CacheHelper.getBoolData(key: 'turnOn');
  token = CacheHelper.getStringData(key: 'token');
  await translator.init(
    localeDefault: LocalizationDefaultType.asDefined,
    languagesList: <String>['en', 'ar'],
    assetsDirectory: 'assets/langs/',
    apiKeyGoogle: '<Key>', // NOT YET TESTED
  );
  runApp(
    LocalizedApp(
      child: MyApp(
        token: token,
        turnOn: turnOn,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  String token;
  bool turnOn;
  MyApp({
    this.token,
    this.turnOn,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => ThemeModeCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => PackageCubit()..getAllPackage(),
        ),
        BlocProvider(
          create: (BuildContext context) => ProfileCubit()..getProfile(),
        ),
        BlocProvider(
          create: (BuildContext context) => ProjectCubit()..getAllProject(),
        ),
        BlocProvider(
          create: (BuildContext context) => NewProjectCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => PortfolioCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => CommercialCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => ECommerceCubit(),
        ),
      ],
      child: BlocConsumer<ThemeModeCubit, ThemeModesStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return ScreenUtilInit(
            designSize: Size(360, 690),
            builder: () => MaterialApp(
              title: 'Mengo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: Colors.blue,
                  backgroundColor: Colors.white,
                  textTheme: TextTheme(
                    button: TextStyle(fontSize: 45.sp),
                  )),
              darkTheme: ThemeData(
                primaryColor: Colors.blueGrey,
                backgroundColor: Colors.black26,
                textTheme: TextTheme(
                  button: TextStyle(fontSize: 45.sp),
                ),
              ),
              themeMode: ThemeModeCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              routes: {
                SplashScreen.routeName: (context) => SplashScreen(),
                LoginScreen.routeName: (context) => LoginScreen(),
                // OtpPhone.routeName: (context) => OtpPhone(),
                // VerificationScreen.routeName: (context) => VerificationScreen(),
                ProfileScreen.routeName: (context) => ProfileScreen(),
                ProjectScreen.routeName: (context) => ProjectScreen(),
                NewProjectScreen.routeName: (context) => NewProjectScreen(),
                AddingColorScreen.routeName: (context) => AddingColorScreen(),
                CreateApkScreen.routeName: (context) => CreateApkScreen(),
                SubscribeScreen.routeName: (context) => SubscribeScreen(),
                AboutScreen.routeName: (context) => AboutScreen(),
                PackageScreen.routeName: (context) => PackageScreen(),
                SubscribeDetailScreen.routeName: (context) =>
                    SubscribeDetailScreen(),
                OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
                RegisterScreen.routeName: (context) => RegisterScreen(),
                WebViews.routeName: (context) => WebViews(),
                PortfolioStartScreen.routeName: (context) =>
                    PortfolioStartScreen(),
                PortfolioAboutScreen.routName: (context) =>
                    PortfolioAboutScreen(),
                PortfolioSkillScreen.routeName: (context) =>
                    PortfolioSkillScreen(),
                PortfolioExperienceScreen.routeName: (context) =>
                    PortfolioExperienceScreen(),
                PortfolioFooterScreen.routeName: (context) =>
                    PortfolioFooterScreen(),
                PortfolioProjectScreen.routeName: (context) =>
                    PortfolioProjectScreen(),
                ECommerceCategoryOneScreen.routeName: (context) =>
                    ECommerceCategoryOneScreen(),
                ECommerceCategoryTwoScreen.routeName: (context) =>
                    ECommerceCategoryTwoScreen(),
                ECommerceCategoryThreeScreen.routeName: (context) =>
                    ECommerceCategoryThreeScreen(),
                ECommerceHomeScreen.routeName: (context) =>
                    ECommerceHomeScreen(),
                ECommerceOfferProductScreen.routeName: (context) =>
                    ECommerceOfferProductScreen(),
                ECommerceSalesProductScreen.routeName: (context) =>
                    ECommerceSalesProductScreen(),
                CommericialAboutScreen.routeName: (context) =>
                    CommericialAboutScreen(),
                CommericialFooterScreen.routeName: (context) =>
                    CommericialFooterScreen(),
                CommericialLatestScreen.routeName: (context) =>
                    CommericialLatestScreen(),
                CommericialProjectScreen.routeName: (context) =>
                    CommericialProjectScreen(),
                CommericialServiceScreen.routeName: (context) =>
                    CommericialServiceScreen(),
                CommericialSingleProjectScreen.routeName: (context) =>
                    CommericialSingleProjectScreen(),
                CommericialSingleServiceScreen.routeName: (context) =>
                    CommericialSingleServiceScreen(),
                CommericialStartScreen.routeName: (context) =>
                    CommericialStartScreen(),
              },
              localizationsDelegates:
                  translator.delegates, // Android + iOS Delegates
              locale: translator.locale, // Active locale
              supportedLocales: translator.locals(), // Locals list
              home: SplashScreen(
                token: token,
                turnOn: turnOn,
              ),
            ),
          );
        },
      ),
    );
  }
}
