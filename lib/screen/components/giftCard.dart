import 'package:flutter/material.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/model/gift.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:provider/provider.dart';

class GiftCard extends StatefulWidget {
 Gift gift ;
 GiftCard({required this.gift});
  @override
  _GiftCardState createState() => _GiftCardState();
}

class _GiftCardState extends State<GiftCard> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Card(
      color: themeProvider.getcardBackgroundColor,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        width: 155,
        child: Column(
          children: [
            Image.asset("assets/images/r1.png"),
            const SizedBox(height: 10,),
            TextWidget(text:widget.gift.giftName, size:16.5, color:themeProvider.getHeadingTextColor, weight:FontWeight.w500, lineheight:17),
            const Divider(thickness: 1,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 10),child:Row(children:[TextWidget(text: "Price", size:13, color:themeProvider.getHeadingTextColor, weight:FontWeight.w400, lineheight:13)],),),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(text: "${widget.gift.price}", size:12, color:const Color.fromRGBO(181, 181, 181, 1), weight: FontWeight.w500, lineheight:11),
                      TextWidget(text: "\$ ${widget.gift.discountedPrice}", size:16, color:themeProvider.getPrimaryColor, weight: FontWeight.w700, lineheight:17),
                      const SizedBox(width: 20,)
                    ],
                ),
            )
          ]),
        ),
    );
  }
}