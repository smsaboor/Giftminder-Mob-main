import 'package:flutter/material.dart';
import 'package:giftminder/components/commonHeader.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/provider/user.dart';
import 'package:giftminder/routes.dart';
import 'package:provider/provider.dart';

class Profileinfo extends StatefulWidget {
  const Profileinfo({ Key? key }) : super(key: key);

  @override
  _ProfileinfoState createState() => _ProfileinfoState();
}

class _ProfileinfoState extends State<Profileinfo> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final userProvider = Provider.of<Users>(context);
    return Material(
      color: themeProvider.getBackgroundColor2,
      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          const CenterHeadingBar(title:"Profile"),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Padding(padding: const EdgeInsets.only(left: 20),child:TextWidget(text:"Account", size:23, color:themeProvider.getHeadingTextColor , weight: FontWeight.w700, lineheight:24)),
                  InkWell(onTap: () => Navigator.pushNamed(context,Routes.ownProfileInfoRoute), child: Listtilecard(themeProvider: themeProvider,label: "My Profile Info",imgAssetDarkMode: "assets/icons/profilecircledark.png",imgAssetLightMode:"assets/icons/profilecircle.png")),
                  const SizedBox(height: 15,),
                  InkWell(onTap: () => Navigator.pushNamed(context,Routes.changePassRoutes), child: Listtilecard(themeProvider: themeProvider, label:"Change Password", imgAssetDarkMode:"assets/icons/Group24dark.png", imgAssetLightMode:"assets/icons/Group24.png")),
                  const SizedBox(height: 15,),
                  InkWell(onTap: () => Navigator.pushNamed(context,Routes.purchaseHistoryRoute),child:Listtilecard(themeProvider: themeProvider, label:"Purchase History", imgAssetDarkMode:"assets/icons/link2dark.png", imgAssetLightMode:"assets/icons/link-2.png")),
                  const SizedBox(height: 30,),
                  Padding(padding: const EdgeInsets.only(left: 20),child:TextWidget(text: "Support", size:23, color:themeProvider.getHeadingTextColor , weight: FontWeight.w700, lineheight:24)),
                  const SizedBox(height: 15,),
                  InkWell(child: Listtilecard(themeProvider: themeProvider, label:"Sign Out", imgAssetDarkMode:"assets/icons/signoutdark.png", imgAssetLightMode:"assets/icons/signout.png"),
                  onTap: () {
                    userProvider.setLogout();
                    Navigator.popUntil(context, (route) => route==Routes.afterSplashScreen);
                    Navigator.pushNamed(context,Routes.afterSplashScreen);
                  },),
                  const SizedBox(height: 15,),
                  InkWell(onTap: () => Navigator.pushNamed(context,Routes.aboutRoute),child:Listtilecard(themeProvider: themeProvider, label:"About Giftminder", imgAssetDarkMode:"assets/icons/aboutddark.png", imgAssetLightMode:"assets/icons/aboutd.png"))
              ]),
          )
        ],
      ),
    );
  }
}



class Listtilecard extends StatefulWidget {
  final String label;
  final String imgAssetLightMode;
  final String imgAssetDarkMode;
   const Listtilecard({super.key,required this.themeProvider,required this.label,required this.imgAssetDarkMode,required this.imgAssetLightMode});

  final ThemeProvider themeProvider;

  @override
  State<Listtilecard> createState() => _ListtilecardState();
}

class _ListtilecardState extends State<Listtilecard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:1.5,
      child:Container(  
        decoration: BoxDecoration(color:widget.themeProvider.getcardBackgroundColor),
        padding: const EdgeInsets.symmetric(horizontal: 19,vertical: 14),
        child: Row(children: [
          widget.themeProvider.getThemeMode?Image.asset(widget.imgAssetDarkMode,):Image.asset(widget.imgAssetLightMode,height: 30,),
          const SizedBox(width: 15,),
          TextWidget(text:widget.label, size:19, color:widget.themeProvider.getHeadingTextColor, weight: FontWeight.w500, lineheight:20)
        ]),
      )
    );
  }
}