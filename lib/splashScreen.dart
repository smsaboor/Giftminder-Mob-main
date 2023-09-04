import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:giftminder/onboarding.dart';
import 'package:giftminder/provider/contactProvider.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/provider/user.dart';
import 'package:provider/provider.dart';

import 'components/text.dart';

class SplashScreens extends StatefulWidget {
const SplashScreens({ Key? key }) : super(key: key);

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {

    bool start = true;
  
  @override
  void initState() {
    Timer(Duration(seconds: 5),  
            (){
              setState(() {
                start=false;
              });
            }
         );
   }

  @override
  Widget build(BuildContext context){
    final themeProvider = Provider.of<ThemeProvider>(context);
    final contactProvider = Provider.of<Contacts>(context);
    final userProvider = Provider.of<Users>(context);
     Provider.of<Users>(context,listen: false).initializeDate();
    userProvider.setUserFromAsync();
    contactProvider.loadContacts();


    return start ? Material(
      color: themeProvider.getBackgroundColor2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [        
          TextWidget(text: "Gift", size: 55, color:themeProvider.getPrimaryColor, weight: FontWeight.w600,lineheight: 14.9),
          SizedBox(
            child: DefaultTextStyle(
            style:TextStyle(
              fontSize: 45.0,
              fontFamily: 'Horizon',
              color: themeProvider.getHeadingTextColor2,
              fontWeight: FontWeight.w600,
              // height: 61.28
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                RotateAnimatedText('Minder'),
                RotateAnimatedText('Minder'),
              ],
              onTap: () {
              },
            ),
            ),
          )
          ]
      ), 
    ) : const AfterSplashScreen();
  }
}

