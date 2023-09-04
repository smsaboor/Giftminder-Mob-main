
import 'package:flutter/material.dart';
import 'package:giftminder/provider/themeProvider.dart';

class SizedBoxDialogDone extends StatelessWidget {
  String label;
  Widget widgets;
  SizedBoxDialogDone({
    required this.widgets,
    required this.label,
    required this.themeProvider,
  });

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      width: 320,
      child: Column(children: [
          widgets,
          const SizedBox(height: 14,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0),
            child: Text(label,textAlign: TextAlign.center, style:const TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
          ),
          const SizedBox(height:4,),
          const Divider(),
          const SizedBox(height: 10,),
          InkWell(onTap:()=> Navigator.pop(context), child:Text('Done',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:themeProvider.getPrimaryColor),))
      ],),
    );
  }
}