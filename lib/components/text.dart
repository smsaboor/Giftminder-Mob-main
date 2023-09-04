import 'package:flutter/material.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:provider/provider.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    required this.size,
    required this.color,
    required this.weight,
    required this.lineheight
  });

  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final double lineheight;


  @override
  Widget build(BuildContext context) => Text(text,style: TextStyle(fontSize: size,fontWeight:weight,color: color),);
}

class PaddingWidget extends StatelessWidget {
  const PaddingWidget({
    super.key,
    required this.paddingHori,
    required this.widget,
  });

  final double paddingHori;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingHori),
          child: widget
        );
  }
}
class TextWidgetCommon extends StatelessWidget {
  const TextWidgetCommon({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context){
     final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Text(text,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: themeProvider.getHeadingTextColor),);
  }
}
