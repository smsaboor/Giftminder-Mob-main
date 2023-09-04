import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:giftminder/components/textsizedboxspacer.dart';
import 'package:giftminder/constant/Strings.dart';
import 'package:email_validator/email_validator.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/provider/user.dart';
import 'package:giftminder/theme/color.dart';
import 'package:giftminder/components/button.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/config/config.dart';
import 'package:giftminder/routes.dart';
import 'package:giftminder/screen/auth/components/commonHeader.dart';
import 'package:giftminder/screen/auth/components/textField.dart';
import 'package:giftminder/connection/api.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({ Key? key }) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}


class _SignupScreenState extends State<SignupScreen> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool invalidEmail = false;
  bool invalidPassLength = false;
  bool invalidName = false;
  void _signup()async{
      invalidEmail = !EmailValidator.validate(_emailController.text);
      invalidPassLength = _passwordController.text.length<8 ? true : false;
      invalidName= _nameController.text.isEmpty ? true : false;
      if(invalidEmail || invalidPassLength || invalidName ){setState(() {});return;}
      setState(() {});
      final userProvider = Provider.of<Users>(context,listen: false);
      Response res = await DioApi.postApi(ConfigUrl.signupUrlPath,{"name":_nameController.text,"email":_emailController.text,"password":_passwordController.text});
      if(res.statusCode!=201){return ;}
      userProvider.createUser(username:_nameController.text, email:_emailController.text,authToken: res.data['token']);
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context,Routes.homeRoute);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    width = width-60.90;
    final themeProvider = Provider.of<ThemeProvider>(context);
    //final userProvider = Provider.of<Users>(context,);
    return Material(
      child: Container(
        decoration: BoxDecoration(color:themeProvider.getBackgroundColor1),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            LoginSignupHeader(firstString: "Already a user?",secondString:"Login",func: ()=>Navigator.pushNamed(context,Routes.loginScreenRoute),),
            CommonContainer1(string1: "Welcome to GiftMinder",string2: ConstantString.signupScreenString1,),
            Container(padding: const EdgeInsets.only(top:40.63,left: 30.45,right: 30.45),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  TextSizedboxspacer(bottom:8, upper:0, widget:const TextWidgetCommon(text: "Name"), ),
                  TextField2(controllers: _nameController, hinttext: "Enter your name",types: TextInputType.text),
                  const SizedBox(height: 7.07,),
                  invalidName ?TextWidget(text:"Please enter valid name", size:13, color:themeProvider.getErrorTextColor, weight:FontWeight.w500, lineheight:17):const Text(""),
                  TextSizedboxspacer(bottom:8, upper:20, widget:const TextWidgetCommon(text: "Email Address")),
                  TextField2(controllers: _emailController, hinttext: "Example@gmail.com",types: TextInputType.emailAddress),
                  const SizedBox(height: 7.07,),
                  invalidEmail ?TextWidget(text:"Please enter vaild email", size:13, color:themeProvider.getErrorTextColor, weight:FontWeight.w500, lineheight:17):const Text(""),
                  TextSizedboxspacer(bottom:8, upper:15, widget: const TextWidgetCommon(text: "Password"),),
                  TextField2(controllers: _passwordController, hinttext: "minimum 8 character",types: TextInputType.text),
                  const SizedBox(height: 7.07,),
                  invalidPassLength ?TextWidget(text:"Password length should be more than 8 alphabet", size:13, color:themeProvider.getErrorTextColor, weight:FontWeight.w500, lineheight:17):const Text(""),
                  const SizedBox(height: 50.96,),
                  ButtonCategory1(fontweight: FontWeight.w600, fontsize: 16, size: Size(width, 50),borderCirculer: 8,borderSideColor: ConstantColor.ButtonBorderColor,backgroundColor:themeProvider.getPrimaryColor,text:"Signup",function:_signup,
                  ),
                ]),
            )
          ],
        ),
      ),
    );
  }
}