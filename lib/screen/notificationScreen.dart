import 'package:flutter/material.dart';
import 'package:giftminder/components/commonHeader.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({ Key? key }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  String reminderText =" Hey, Harvey Specter birthday in 7 days, Plan something for them.";

  void forwardBuy(){
   
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    width = width-60.90;
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Material(
      color: themeProvider.getBackgroundColor2,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children:[
        const CenterHeadingBar(title:"Notifications"),
        Container(
          padding: const EdgeInsets.symmetric(horizontal:20,vertical: 25),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(text: "Reminders", size:23, color:themeProvider.getHeadingTextColor , weight: FontWeight.w700, lineheight:24),
              const SizedBox(height: 22,),
              notificationCard(themeProvider)
          ]),
        )
      ]),
    );
  }

  Card notificationCard(ThemeProvider themeProvider) {
    return Card(child: 
      Container(decoration: BoxDecoration(color: themeProvider.getcardBackgroundColor), padding:const EdgeInsets.only(top: 20,left: 19,right: 20),
        child: Column(children: [
            TextWidget(text:reminderText, size:15, color:themeProvider.getTextColor2, weight:FontWeight.w500, lineheight:16),
            const SizedBox(height: 20,),
            Divider(color: themeProvider.getdividerColor,),
            InkWell(onTap:forwardBuy, child: TextWidget(text: "Buy Gift", size:17, color:themeProvider.getPrimaryColor, weight:FontWeight.w500, lineheight:18),),
            const SizedBox(height: 12,)
          ],)
      ),
    );
  }
}