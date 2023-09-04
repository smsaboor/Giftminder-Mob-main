
import 'package:flutter/material.dart';
import 'package:giftminder/components/button.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/home.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/provider/user.dart';
import 'package:giftminder/routes.dart';
import 'package:provider/provider.dart';


class AfterSplashScreen extends StatelessWidget {
const AfterSplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){

    final themeProvider = Provider.of<ThemeProvider>(context);
    final userProvider = Provider.of<Users>(context);
    bool isDark = themeProvider.getThemeMode;
    
    return userProvider.isLoggedUser?const Home():Material(
      color: themeProvider.getBackgroundColor2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center, 
            children:[
              TextWidget(text: "Gift", size: 36, color: themeProvider.getPrimaryColor, weight: FontWeight.w600,lineheight:49.03,),
              TextWidget(text: "Minder", size: 28, color:themeProvider.getHeadingTextColor2, weight: FontWeight.w600,lineheight: 38.13,)
              ]
          ),   
          isDark? Image.asset("assets/images/sga.png",width: 314,height: 315,) : Image.asset("assets/images/Send-gift-amico.png",width: 314,height: 315,),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(text: "Your Gifting Reminder", size: 35, color:themeProvider.getHeadingTextColor2, weight: FontWeight.w600,lineheight: 40,),
            ],
          ),
          const SizedBox(height: 15,),
          SizedBox(height: 44,width: 342, child:PaddingWidget(paddingHori: 0, widget: TextWidget(text: "Family, Friends and other gifting made easy through through the giftreminder", size: 18, color:themeProvider.getaccentColor, weight: FontWeight.w400,lineheight: 22,))),
          const SizedBox(height: 60,),
          ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(320, 50)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                backgroundColor:MaterialStateProperty.all(themeProvider.getThemeMode? const Color.fromRGBO(47, 50, 55, 1):const Color.fromRGBO(255,255,255,1))
                ),
              onPressed:()=>Navigator.pushNamed(context, Routes.loginScreenRoute),
              child: Text("I have an account",style: TextStyle(color: themeProvider.getThemeMode? themeProvider.getHeadingTextColor : Colors.black87,fontSize:16),),
          ),
          const SizedBox(height: 20,),
          PaddingWidget(paddingHori: 35, widget: ButtonCategory1(fontweight: FontWeight.w600, fontsize: 16, size: const Size(320, 50),borderCirculer: 8,borderSideColor: const Color.fromRGBO(175, 175, 175, 0.5),backgroundColor:themeProvider.getPrimaryColor,text:"Get Started",
              function:(){Navigator.pushNamed(context, Routes.signupScreenRoute);}
            )),
          
        ],
      ),
    );
  }
}
