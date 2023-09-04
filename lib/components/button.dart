
import 'package:flutter/material.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:provider/provider.dart';

class ButtonCategory1 extends StatelessWidget {
  final Size size ;
  double borderCirculer;
  Color borderSideColor;
  Color backgroundColor;
  Function function;
  String text;
  double fontsize;
  FontWeight fontweight;

  ButtonCategory1({required this.fontweight, required this.fontsize, required this.size,required this.borderCirculer,required this.borderSideColor,required this.backgroundColor,required this.function,required this.text});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(size),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderCirculer))),
        backgroundColor:MaterialStateProperty.all(backgroundColor)
        ),
      onPressed: (){function();},
      child: Text(text,style: TextStyle(color:themeProvider.getButtonTextColor,fontSize: fontsize),),
      );
  }
}


class IncreDecreButton extends StatefulWidget {
  Function incre;
  Function decre;
  IncreDecreButton({required this.decre,required this.incre});
  @override
  _IncreDecreButtonState createState() => _IncreDecreButtonState();
}

class _IncreDecreButtonState extends State<IncreDecreButton> {
  int num = 1;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      height: 40,
      width: 110,
      decoration: BoxDecoration(borderRadius:const BorderRadius.all(Radius.circular(7)), border:Border.all(width: 1,color: themeProvider.getTextColor3)),
      child:  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
         InkWell(onTap:(){widget.decre();if(num==0){return;}num--;setState(() {});}, child: Icon(Icons.remove,color: themeProvider.getHeadingTextColor,),),
         TextWidget(text: "$num", size:20, color:themeProvider.getPrimaryColor, weight: FontWeight.w500, lineheight:21),
         InkWell(onTap: (){widget.incre();num++;setState(() {});}, child: Icon(Icons.add,color: themeProvider.getHeadingTextColor,),),
      ],
    ),
    );
  }
}