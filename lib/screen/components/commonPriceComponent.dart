import 'package:flutter/material.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/model/gift.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:provider/provider.dart';

class CommonPriceComponent extends StatefulWidget {
  Gift gift;
  CommonPriceComponent({required this.gift});
  @override
  State<CommonPriceComponent> createState() => _CommonPriceComponentState();
}

class _CommonPriceComponentState extends State<CommonPriceComponent> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Row(children: [
            TextWidget(size: 16,text: "Price :",color:themeProvider.getTextColor2 ,weight: FontWeight.w400,lineheight: 17,),
            TextWidget(size: 14,text: "  ${widget.gift.discountedPrice}",color:themeProvider.getTextColor3 ,weight: FontWeight.w400,lineheight: 17,),
            TextWidget(size: 18,text: "   ${widget.gift.percentOff} %Off",color:themeProvider.getTextColor4,weight: FontWeight.w400,lineheight: 17,)
          ],
        ),
        const SizedBox(height: 5,),
        Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(size:24,text: "\$ ${widget.gift.price}                  ",color:themeProvider.getPrimaryColor ,weight: FontWeight.w600,lineheight: 17,),
          ],
        )
      ],
    );
  }
}