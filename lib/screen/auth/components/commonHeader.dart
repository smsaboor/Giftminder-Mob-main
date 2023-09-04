
import 'package:flutter/material.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/theme/color.dart';
import 'package:giftminder/components/text.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LoginSignupHeader extends StatelessWidget {
  String firstString;
  String secondString;
  Function func;
  LoginSignupHeader({super.key, required this.func, required this.firstString,required this.secondString});
  
  @override
  Widget build(BuildContext context) {
    void funct(){func();}
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        gradient:themeProvider.getLinearGradientAppBar ,
        ),
      padding: const EdgeInsets.symmetric(horizontal: 30.45),
      height: 115,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          Padding(padding: const EdgeInsets.only(top:56.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,children:[
                      TextWidget(text: "Gift", size: 24, color: themeProvider.getPrimaryColor, weight: FontWeight.w600,lineheight:49.03,),
                      TextWidget(text: "Minder", size: 20, color:themeProvider.getHeadingTextColor2, weight: FontWeight.w600,lineheight: 38.13,)
                    ]),
          ), 
          Padding(padding: const EdgeInsets.only(top:56.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,children:[
                TextWidget(text:firstString, size: 16, color: themeProvider.getTextColor2, weight: FontWeight.w600,lineheight:49.03,),
                TextButton(onPressed: funct, child: TextWidget(text: secondString, size: 20, color:themeProvider.getPrimaryColor, weight: FontWeight.w600,lineheight: 38.13,))
              ]),
          ),
      ]),
    );
  }
}

class CommonContainer1 extends StatelessWidget {
  final String string1;
  final String string2;

  const CommonContainer1({super.key, required this.string1,required this.string2});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      //decoration: BoxDecoration(color:themeProvider.getBackgroundColor1,),
      padding: const EdgeInsets.only(top: 35.43,left: 30.45,right: 30.45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(string1,style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w800,
          color: themeProvider.getHeadingTextColor),
        ),
        const SizedBox(height: 8.76,),
        Text(string2,style: TextStyle(color:themeProvider.getTextColor1,fontSize: 16),),
      
      ]),
    );
  }
}


