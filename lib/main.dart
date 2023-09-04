import 'package:flutter/material.dart';
import 'package:giftminder/provider/addresses.dart';
import 'package:giftminder/provider/contactProvider.dart';
import 'package:giftminder/provider/eventProvider.dart';
import 'package:giftminder/provider/giftsprovider.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/provider/transactions.dart';
import 'package:giftminder/provider/user.dart';
import 'package:giftminder/routes.dart';
import 'package:giftminder/onboarding.dart';
import 'package:giftminder/screen/about/about.dart';
import 'package:giftminder/screen/address/addAdress.dart';
import 'package:giftminder/screen/address/addressOptionScreen.dart';
import 'package:giftminder/screen/address/selectAdress.dart';
import 'package:giftminder/screen/auth/forgotpass.dart';
import 'package:giftminder/screen/auth/loginScreen.dart';
import 'package:giftminder/screen/auth/signupScreen.dart';
import 'package:giftminder/screen/changepass.dart';
import 'package:giftminder/screen/editprofile.dart';
import 'package:giftminder/screen/eventsInputScreen.dart';
import 'package:giftminder/screen/giftdetail.dart';
import 'package:giftminder/home.dart';
import 'package:giftminder/screen/localstate/local.dart';
import 'package:giftminder/screen/notificationScreen.dart';
import 'package:giftminder/screen/profileinfo.dart';
import 'package:giftminder/screen/tab/calender.dart';
import 'package:giftminder/screen/tab/calenders.dart';
import 'package:giftminder/screen/tranHistory.dart';
import 'package:giftminder/screen/userProfile.dart';
import 'package:giftminder/splashScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (context) => Events(),),
          ChangeNotifierProvider(create: (context) => ThemeProvider(),),
          ChangeNotifierProvider(create: (context) => Gifts(),),
          ChangeNotifierProvider(create: (context) => Users()),
          ChangeNotifierProvider(create:(context)=>Contacts()),
          ChangeNotifierProvider(create:(context)=>Addresses()),
          ChangeNotifierProvider(create:(context)=>LocalDialogStateManagement()),
          ChangeNotifierProvider(create: (context)=>Transactions())
        ],
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'giftminder',
        home: const SplashScreens(),
        routes: {
            Routes.splashScreenRoute:(context) => const  SplashScreens(),
            Routes.loginScreenRoute:(context) => const LoginScreen(),
            Routes.afterSplashScreen:(context) => const  AfterSplashScreen(),
            Routes.signupScreenRoute:(context) => const SignupScreen(),
            Routes.forgotPassScreen:(context) => const Forgotpass(),
            Routes.homeRoute:(context) => const Home(),
            Routes.profileRoute:(context) => const UserProfile(),
            Routes.eventsInputScreenRoute:(context) => const EventsInputScreen(),
            Routes.ownProfileRoute:(context) => const  Profileinfo(),
            Routes.ownProfileInfoRoute:(context) => const Editprofile(),
            Routes.changePassRoutes:(context) => const Changepass(),
            Routes.aboutRoute:(context) => const About(),
            Routes.aboutUsRoute:(context) => const AboutUs(),
            Routes.aboutUsTeamRoute:(context) => const Team(),
            Routes.giftItemRoute:(context) => const Giftdetail(),
            Routes.selectAddress:(context) => const SelectAdress(),
            Routes.addNewAddress:(context) => const AddAdress(),
            Routes.selectAddressOptionRoute:(context) => const AddressOptionScreen(),
            Routes.purchaseHistoryRoute:(context) => const TranHistory(),
            Routes.notificationsScreen:(context) => const NotificationScreen(),
            Routes.calenderSelect:(context) => const Calenders()
        },
      )
    );
  }
}