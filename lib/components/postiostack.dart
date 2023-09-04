
import 'package:flutter/material.dart';

class PositionStack extends StatelessWidget {
  const PositionStack({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      right: 0.0,
      child:InkWell(  
        onTap:(){
          Navigator.of(context).pop(false);
        },
        child: Image.asset("assets/icons/cross.png"),
      )
    );
  }
}