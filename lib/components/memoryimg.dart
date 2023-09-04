import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MemoryImg extends StatefulWidget {
 Uint8List? bytes;
 double radius;
 MemoryImg({this.bytes,required this.radius});

  @override
  State<MemoryImg> createState() => _MemoryImgState();
}

class _MemoryImgState extends State<MemoryImg> {

  Uint8List? bytes;
   void setImageBytes() async {
    setState(() {
      //bytes = Base64Codec().decode(widget.bytes!.imageBase64);
    });
  }

  @override
  Widget build(BuildContext context){
    //print(widget.bytes.runtimeType);
    return widget.bytes==null?CircleAvatar(backgroundImage:const AssetImage("assets/images/avtr.png"),radius:widget.radius,):CircleAvatar(backgroundImage:const AssetImage("assets/images/avtr.png"),radius:widget.radius,);
  }
}