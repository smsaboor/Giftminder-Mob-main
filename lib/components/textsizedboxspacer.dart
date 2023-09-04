import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextSizedboxspacer extends StatelessWidget {
  Widget widget;
  double upper;
  double bottom;

  TextSizedboxspacer({super.key, required this.bottom,required this.upper, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          SizedBox(height: upper,),
          widget,
          SizedBox(height:bottom),
      ],
    );
  }
}