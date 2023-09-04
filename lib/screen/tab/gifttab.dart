import 'package:flutter/material.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/provider/giftsprovider.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/routes.dart';
import 'package:giftminder/screen/components/giftCard.dart';
import 'package:giftminder/screen/components/headerHome.dart';
import 'package:giftminder/components/searchField.dart';
import 'package:provider/provider.dart';

class Gifttab extends StatefulWidget {
  const Gifttab({ Key? key }) : super(key: key);
  @override
  _GifttabState createState() => _GifttabState();
}

class _GifttabState extends State<Gifttab> {
  String _user = "Divyam";
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final giftProvider = Provider.of<Gifts>(context);
    final gifts = giftProvider.getGiftList;
    return Material(
       color: themeProvider.getBackgroundColor1,
       child: SingleChildScrollView(
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            const homeBar(),
            const SizedBox(height: 15,),
            const SearchField(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(text: "Gift Suggestions", size:22, color:themeProvider.getHeadingTextColor, weight:FontWeight.w600, lineheight:23),
                  const SizedBox(height: 5,),
                  TextWidget(text: "$_user", size:18, color:themeProvider.getPrimaryColor, weight:FontWeight.w600, lineheight:19),
                  SizedBox(
                    height: 458,
                    child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 7/10),
                    itemCount: gifts.length,
                    itemBuilder: (context, index) {
                       return InkWell(
                          onTap: () {
                             Navigator.of(context).pushNamed(Routes.giftItemRoute,arguments: gifts[index]);
                          },
                          child: GiftCard(gift: gifts[index]),
                  );
                },
              )
            )
          ],),
        )
      ],),
     )
    );
  }
}