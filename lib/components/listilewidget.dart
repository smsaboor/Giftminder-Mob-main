import 'package:flutter/material.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:provider/provider.dart';

class ListtileleWidget extends StatefulWidget {
  Function func;
  String label;
  ListtileleWidget({ Key? key ,required this.func,required this.label }) : super(key: key);

  @override
  _ListtileleWidgetState createState() => _ListtileleWidgetState();
}

class _ListtileleWidgetState extends State<ListtileleWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Card(
        child: Container(  
          decoration: BoxDecoration(color: themeProvider.getcardBackgroundColor),
          padding: const EdgeInsets.only(left: 20,top: 14,bottom: 14,right: 17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(text: widget.label, size:19, color:themeProvider.getHeadingTextColor, weight:FontWeight.w500, lineheight:20),
              InkWell(onTap: (){
                    widget.func();
                }, child: Icon(Icons.arrow_forward_ios,color:themeProvider.getHeadingTextColor,),
              ),
            ],
        ),
        )
    );
  }
}