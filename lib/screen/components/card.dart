
import 'package:flutter/material.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/constant/Strings.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:provider/provider.dart';

class CardHome extends StatelessWidget {
  Widget widgetRow1;
  Widget widgetRow2;
  Widget widgetRow3;

  CardHome({required this.widgetRow1,required this.widgetRow2,required this.widgetRow3});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Card(
      elevation: 1,
      color:themeProvider.getcardBackgroundColor,
      child: Container(
          padding: const EdgeInsets.only(right: 8, left: 8,top: 20,bottom: 18),
          child: Column(
            children: [
              widgetRow1,
              const SizedBox(height: 20,),
              widgetRow2,
              const Divider(thickness: 1.5,),
              widgetRow3,
          ],),
      )
    );
  }
}

class CardHomeNewUser extends StatelessWidget {
  const CardHomeNewUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return CardHome(
      widgetRow1: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap:() {
              
            },
            child:Icon(Icons.add_circle_outline,size: 70,color:themeProvider.getPrimaryColor),
          ),
          //const SizedBox(width: 40,)
        ],
      ),
      widgetRow2:TextWidget(text:"Add Events", size:22, color:themeProvider.getHeadingTextColor, weight:FontWeight.w600, lineheight:23),   //const Text(,style: TextStyle(fontSize: 22,fontWeight: ),),
      widgetRow3:Text(ConstantString.notAddedAnyEvent,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color:themeProvider.getTextColor2),
      ),
    );
  }
}