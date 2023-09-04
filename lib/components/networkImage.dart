import 'package:flutter/material.dart';
// ignore: must_be_immutable
class NetworkImg extends StatelessWidget {
  String url;
  double height;
  double width;
  NetworkImg({super.key, required this.url,required this.height,required this.width});

  @override
  Widget build(BuildContext context){
    return Image.asset("assets/images/r11.png",height:height,width:width,);

    //return Image.network(url,height:height,width:width,)
  }
}