import 'package:flutter/material.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:provider/provider.dart';

class CenterHeadingBar extends StatelessWidget {
  final String title;
  const CenterHeadingBar({required this.title});

  @override
  Widget build(BuildContext context) {
    
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Container(
      decoration: BoxDecoration(gradient:themeProvider.getLinearGradientAppBar),
      padding: const EdgeInsets.symmetric(horizontal: 30.45),
      height: 120,
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(top:56.0),
          child: IconButton(
            onPressed:(){
              Navigator.of(context).pop();
            },
            icon:Icon(Icons.arrow_back_ios,size:23,color:themeProvider.getHeadingTextColor,)),
        ), 
        Padding(
          padding: const EdgeInsets.only(top:56.0,left:55),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              children:[
                  TextWidget(text:title, size: 18, color:themeProvider.getHeadingTextColor, weight: FontWeight.w600,lineheight:49.03,),
                ]
            ),
          ),
        ]
      ),
    );
  }
}