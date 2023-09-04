
import 'package:flutter/material.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/provider/themeProvider.dart';

class RowTextIconButton extends StatelessWidget {
  Function func;
  double textsize;
  double iconsize;
  String label;
  RowTextIconButton({
    super.key,
    required this.label,
    required this.func,
    required this.iconsize,
    required this.textsize,
    required this.themeProvider,
  });
  final ThemeProvider themeProvider;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:25 ), 
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
            TextWidget(text:label, size:textsize, color:themeProvider.getHeadingTextColor, weight:FontWeight.w600, lineheight:26),
            InkWell(
              onTap:()=>func(),
              child:Icon(Icons.add_circle_outline,size: iconsize,color:themeProvider.getPrimaryColor),
            )
      ],));
  }
}