// import 'package:flutter/material.dart';
// import 'package:giftminder/components/text.dart';
// import 'package:giftminder/provider/themeProvider.dart';

// class AfterHeaderTitle1 extends StatefulWidget {
//   const AfterHeaderTitle({
//     super.key,
//     required this.label,
//     required this.themeProvider,
//   });
//   final String label;
//   final ThemeProvider themeProvider;

//   @override
//   State<AfterHeaderTitle> createState() => _AfterHeaderTitleState();
// }

// class _AfterHeaderTitleState extends State<AfterHeaderTitle> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(padding: const EdgeInsets.only(left: 20),child:TextWidget(text:widget.label, size:23, color:widget.themeProvider.getHeadingTextColor , weight: FontWeight.w700, lineheight:24));
//   }
// }