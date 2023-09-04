import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:giftminder/components/textsizedboxspacer.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/provider/user.dart';
import 'package:giftminder/theme/color.dart';
import 'package:giftminder/components/button.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/config/config.dart';
import 'package:giftminder/routes.dart';
import 'package:giftminder/screen/auth/components/textField.dart';
import 'package:giftminder/connection/api.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'components/commonHeader.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    bool enteredWrong = false;
   
    void _login()async{
        final userProvider = Provider.of<Users>(context,listen: false);
        if(_emailController.text.isEmpty || _passwordController.text.isEmpty){return;}
        http.StreamedResponse response = await  DioApi.postApihttp(ConfigUrl.loginUrlPath,{"email":_emailController.text,"password":_passwordController.text});
        if(response.statusCode!=200){setState(() {enteredWrong =true;});return;}
        var jsonResponse = json.decode(await response.stream.bytesToString());
        userProvider.createUser(username:jsonResponse['user']['name'], email:_emailController.text,authToken:jsonResponse['token']);
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, Routes.homeRoute);
     }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    width = width-60.90;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Material(child: Container(decoration: BoxDecoration(color:themeProvider.getBackgroundColor1),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            LoginSignupHeader(firstString: "Not signup",secondString:"SignUp",func: ()=>Navigator.pushNamed(context,Routes.signupScreenRoute),),
            const CommonContainer1(string1: "Welcome Back", string2:"Please provide the credential below"),
            Container(padding: const EdgeInsets.only(top:40.63,left: 30.45,right: 30.45),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  TextSizedboxspacer(bottom:8, upper:0, widget:const TextWidgetCommon(text: "Email Address")),
                  TextField2(controllers: _emailController, hinttext: "Example@gmail.com",types: TextInputType.emailAddress,),
                  TextSizedboxspacer(bottom: 8, upper:20, widget:const TextWidgetCommon(text: "Password"),),
                  TextField2(controllers: _passwordController, hinttext: "Enter your password",types:TextInputType.text,),
                  const SizedBox(height: 10,),
                  enteredWrong ?TextWidget(text:"Entered email & password is invalid", size:16, color:themeProvider.getErrorTextColor, weight:FontWeight.w600, lineheight:17):const Text(""),
                  const SizedBox(height: 7.07,),
                  InkWell(onTap:()=>Navigator.pushNamed(context, Routes.forgotPassScreen) , child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [TextWidget(text: "Forgot Password?", size:14, color:themeProvider.getTextColor2, weight:FontWeight.w600, lineheight:15),],)),
                  const SizedBox(height: 42.96,),
                  ButtonCategory1(fontweight: FontWeight.w600, fontsize: 16, size: Size(width, 50),borderCirculer: 8,borderSideColor: ConstantColor.ButtonBorderColor,backgroundColor:themeProvider.getPrimaryColor,text:"Login",function:_login),
              ]),
            )
          ]
        )
      )
    );
  }
}