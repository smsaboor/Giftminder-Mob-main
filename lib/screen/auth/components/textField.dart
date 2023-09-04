
import 'package:flutter/material.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:provider/provider.dart';

class TextFields extends StatelessWidget {
  TextFields({
    required this.validate,
    required this.types,
    required this.erortext,
    required this.controllers,
    required this.hinttext,
  });
  final TextInputType types;

  final TextEditingController controllers;
  final String hinttext;
  final String erortext;
  bool validate;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return TextField(
      keyboardType:types,
        style: TextStyle(color:themeProvider.getHeadingTextColor ),
        controller: controllers,
        decoration: InputDecoration(
          filled: true,
          fillColor: themeProvider.gettextFieldBackgroundColor,
          hintText: hinttext,
          errorText:validate ? "" : erortext,
          errorBorder:outlineborder(), 
          hintStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: themeProvider.getlabelColor1),
          enabledBorder: outlineborder()
        ),
      );
  }

  OutlineInputBorder outlineborder() {
    return OutlineInputBorder(
            borderSide:
                const BorderSide(width: 1,color: Color.fromARGB(60, 18, 17, 17)), //<-- SEE HERE
            borderRadius: BorderRadius.circular(8.0),
          );
  }
}



class TextField2 extends StatelessWidget {
  TextField2({
    required this.types,
    required this.controllers,
    required this.hinttext,
  });
  final TextInputType types;

  final TextEditingController controllers;
  final String hinttext;
 // final String erortext;


  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return TextField(
      keyboardType:types,
        style: TextStyle(color:themeProvider.getHeadingTextColor ),
        controller: controllers,
        decoration: InputDecoration(
          filled: true,
          fillColor: themeProvider.gettextFieldBackgroundColor,
          hintText: hinttext,
          // errorText:validate ? "" : erortext,
          errorBorder:OutlineBorder.outlineborder(), 
          hintStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: themeProvider.getlabelColor1),
          enabledBorder: OutlineBorder.outlineborder()
        ),
      );
  }
}

class OutlineBorder {
  static OutlineInputBorder outlineborder() {
    return OutlineInputBorder(
            borderSide:
                const BorderSide(width: 1,color: Color.fromARGB(60, 18, 17, 17)), //<-- SEE HERE
            borderRadius: BorderRadius.circular(8.0),
          );
  }
}



class TextFieldInterest extends StatefulWidget {
  TextFieldInterest({required this.controllers,required this.func});

  TextEditingController controllers;
  Function func;

  @override
  _TextFieldInterestState createState() => _TextFieldInterestState();
}

class _TextFieldInterestState extends State<TextFieldInterest> {

  
  @override
  Widget build(BuildContext context) {
    Function fvoid = widget.func;
     final themeProvider = Provider.of<ThemeProvider>(context);

    return TextField(
      //maxLength:20,
      controller: widget.controllers,
      style: TextStyle(color:themeProvider.getHeadingTextColor ),
      decoration:InputDecoration( 
        filled: true,
        fillColor: themeProvider.gettextFieldBackgroundColor,
        hintStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: themeProvider.getlabelColor1),
        suffixIcon:IconButton(icon:ImageIcon(const AssetImage("assets/icons/VectorDown.png"),size: 42,color:themeProvider.getPrimaryColor),onPressed:(){fvoid();},) ,
        hintText: "Type or pick three Interests",
        enabledBorder: OutlineBorder.outlineborder()
      ),
    );
  }
}



