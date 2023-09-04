import 'package:flutter/material.dart';
import 'package:giftminder/components/commonHeader.dart';
import 'package:giftminder/components/listilewidget.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/constant/Strings.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/routes.dart';
import 'package:provider/provider.dart';

class About extends StatefulWidget {
  const About({ Key? key }) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Material(
      color: themeProvider.getBackgroundColor2,
      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          const CenterHeadingBar(title:"About GiftMinder"),
          Container(
            padding: const EdgeInsets.symmetric(horizontal:25,vertical: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                 ListtileleWidget(func:(){

                    }, label:"Privacy Policy"),
                 const SizedBox(height: 15,),
                 ListtileleWidget(func:(){

                    }, label:"Terms of Service"),
                const SizedBox(height: 15,),
                 ListtileleWidget(func:()=>Navigator.pushNamed(context,Routes.aboutUsRoute), label:"About Us"),
              ]),
          )
        ],
      ),
    );
  }
}

class AboutUs extends StatefulWidget {
  const AboutUs({ Key? key }) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Material(
      color: themeProvider.getBackgroundColor2,
      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          const CenterHeadingBar(title:"About Us"),
          Container(
            padding: const EdgeInsets.symmetric(horizontal:25,vertical: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                 ListtileleWidget(func:()=>Navigator.pushNamed(context,Routes.aboutUsTeamRoute), label:"Team"),
                 const SizedBox(height: 15,),
                 ListtileleWidget(func:(){

                    }, label:"History"),
              ]),
          )
        ],
      ),
    );
  }
}

class Team extends StatefulWidget {
  const Team({ Key? key }) : super(key: key);

  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Material(
      color: themeProvider.getBackgroundColor2,
      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          const CenterHeadingBar(title:"Team"),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 20),
            child: Card(
            child: Container(
              decoration: BoxDecoration(color: themeProvider.getcardBackgroundColor),
              padding: const EdgeInsets.symmetric(horizontal:20,vertical: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextWidget(text: "About our team", size:18, color:themeProvider.getHeadingTextColor, weight: FontWeight.w700, lineheight:19),
                  const SizedBox(height: 20,),
                  TextWidget(text: ConstantString.aboutUs, size:14, color:themeProvider.getTextColor2, weight:FontWeight.w400, lineheight:15) 
                ]),
            ),
          ),
          )
        ],
      ),
    );
  }
}

