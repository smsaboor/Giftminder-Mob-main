import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:giftminder/components/button.dart';
import 'package:giftminder/components/commonHeader.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/components/textsizedboxspacer.dart';
import 'package:giftminder/config/config.dart';
import 'package:giftminder/helper/sharedStorageManager.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/screen/auth/components/textField.dart';
import 'package:giftminder/components/SizedBoxDialogDone.dart';
import 'package:giftminder/screen/components/eventCard.dart';
import 'package:giftminder/connection/api.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Changepass extends StatefulWidget {
  const Changepass({ Key? key }) : super(key: key);

  @override
  _ChangepassState createState() => _ChangepassState();
}

class _ChangepassState extends State<Changepass> {

   final TextEditingController _confirmNewPasswordController = TextEditingController();
   final TextEditingController _newPasswordController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();
   bool enteredPassWrong = false;
   bool isNotSame = false;
   bool isSameOld = false;
   bool isValidNewPass = false;
   void _changepass()async{
        if(_newPasswordController.text!=_confirmNewPasswordController.text){setState(() {isNotSame=true;});
          return;
        }else{setState(() {isNotSame=false;});}
        _newPasswordController.text.length<8 ? setState(() {isValidNewPass = true;}) : setState(() {isValidNewPass = false;});
        String authToken = await SharedStorageManager.readData("AuthToken");
        if(_confirmNewPasswordController.text.isEmpty ||  _newPasswordController.text.isEmpty || _passwordController.text.isEmpty){return;}
        http.StreamedResponse response = await  DioApi.postApihttptoken(authToken, ConfigUrl.resetPassPath,{"password":_passwordController.text,"newpass":_newPasswordController.text});
        if(response.statusCode!=200){setState(() {enteredPassWrong =true;});return;}
    // ignore: use_build_context_synchronously
        final themeProvider = Provider.of<ThemeProvider>(context,listen: false);
          // ignore: use_build_context_synchronously
          await showDialog(
              context: context,
              builder: (context) => Dialog1(
                content: SizedBoxDialogDone(
                  themeProvider: themeProvider,
                  label: "Password Updated",
                  widgets: themeProvider.getThemeMode ?Image.asset("assets/icons/tickcircledark.png",height: 75,width: 75,): Image.asset("assets/icons/tick-circle.png",height: 75,width: 75,)))
            );
          }
   
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    width = width-68;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Material(color: themeProvider.getBackgroundColor2,
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
          const CenterHeadingBar(title:"Change Password"),
          Container(padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 22),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  TextSizedboxspacer(bottom: 7.07, upper:0, widget:const TextWidgetCommon(text: "Password")),
                  TextField2(controllers: _passwordController, hinttext: "Enter your password",types: TextInputType.text),
                  const SizedBox(height: 7.07,),
                  enteredPassWrong ?TextWidget(text:"Entered password is invalid", size:13, color:themeProvider.getErrorTextColor, weight:FontWeight.w600, lineheight:17):const Text(""),
                  TextSizedboxspacer(bottom:7.07, upper:20, widget:const TextWidgetCommon(text: "New Password"),),
                  TextField2(controllers: _newPasswordController, hinttext: "Enter your new password",types: TextInputType.text),
                  TextSizedboxspacer(bottom:7.07, upper:20, widget:const TextWidgetCommon(text: "Confirm New Password"),),
                  TextField2(controllers: _confirmNewPasswordController, hinttext: "Confirm new password",types: TextInputType.text),
                  const SizedBox(height: 7.07,),
                  isValidNewPass ?TextWidget(text:"new pass length should be more than 7", size:13, color:themeProvider.getErrorTextColor, weight:FontWeight.w600, lineheight:17):const Text(""),
                  isNotSame ?TextWidget(text:"new pass and confirm pass should same", size:13, color:themeProvider.getErrorTextColor, weight:FontWeight.w600, lineheight:17):const Text(""),
                  const SizedBox(height: 40,),
                  ButtonCategory1(fontweight: FontWeight.w600, fontsize: 16, size: Size(width, 50),borderCirculer: 8,borderSideColor:themeProvider.getaccentColor,backgroundColor:themeProvider.getPrimaryColor,text:"Done",
                    function:_changepass)
            ]),
          )
        ],
      ),
    );
  }
}