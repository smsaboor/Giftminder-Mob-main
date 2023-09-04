import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/theme/color.dart';
import 'package:giftminder/components/button.dart';
import 'package:giftminder/components/commonHeader.dart';
import 'package:giftminder/components/dialog.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/config/config.dart';
import 'package:giftminder/screen/auth/components/commonHeader.dart';
import 'package:giftminder/screen/auth/components/textField.dart';
import 'package:giftminder/connection/api.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Forgotpass extends StatefulWidget {
  const Forgotpass({ Key? key }) : super(key: key);

  @override
  _ForgotpassState createState() => _ForgotpassState();
}

class _ForgotpassState extends State<Forgotpass> {


  final TextEditingController _emailController = TextEditingController();

  void forgotPass()async {
    if(_emailController.text.isEmpty){
        return;
    }                 
    final themeProvider = Provider.of<ThemeProvider>(context,listen: false);
    http.StreamedResponse res =await DioApi.postApihttp(ConfigUrl.forgotPassPath,{"email":_emailController.text});
    if(res.statusCode==200){
        // ignore: use_build_context_synchronously
        showMyDialog(
          dialogHeight: 195,
          context:context,
          widgetRow1: themeProvider.getThemeMode ?Image.asset("assets/icons/tickcircledark.png",height: 75,width: 75,): Image.asset("assets/icons/tick-circle.png",height: 75,width: 75,),
          hidepositioned: true,
          widgetRow2: const Text("password reset link has been sent to your registered email address",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
          widgetRow3: InkWell(onTap:()=> Navigator.of(context).pop() , child: const Text('Done',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color.fromRGBO(217, 89, 136, 1)),))
        );
    } else if(res.statusCode==404){
      // ignore: use_build_context_synchronously
      ErrorDialog(context, "User Not Found");
    }else{
      // ignore: use_build_context_synchronously
      ErrorDialog(context, "Something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    width = width-60.90;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Material(
      color:themeProvider.getBackgroundColor1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CenterHeadingBar(title: "Forgot password",),
          const CommonContainer1(string1: "Forgot password?",string2: "Please provide the registered Email Address",),
          Container(decoration: BoxDecoration(color:themeProvider.getBackgroundColor1,),
            padding:const EdgeInsets.only(top:40.63,left: 30.45,right: 30.45),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                const TextWidgetCommon(text: "Email Address"),
                const SizedBox(height: 7.07,),
                TextFields(controllers: _emailController, hinttext: "Enter your email address",types: TextInputType.emailAddress,validate: true,erortext: "",),
                const SizedBox(height: 50.96,),
                ButtonCategory1(fontweight: FontWeight.w600, fontsize: 16, size: Size(width, 50),borderCirculer: 8,borderSideColor: ConstantColor.ButtonBorderColor,backgroundColor:themeProvider.getPrimaryColor,text:"Done",function:forgotPass),
          ]),
        ),   
      ]),
    );
  }
}

