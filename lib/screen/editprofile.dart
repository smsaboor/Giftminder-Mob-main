import 'package:flutter/material.dart';
import 'package:giftminder/components/commonHeader.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/provider/user.dart';
import 'package:giftminder/screen/auth/components/textField.dart';
import 'package:giftminder/components/SizedBoxDialogDone.dart';
import 'package:giftminder/screen/components/eventCard.dart';
import 'package:provider/provider.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({ Key? key }) : super(key: key);

  @override
  _EditprofileState createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    final userProvider = Provider.of<Users>(context,listen: false);
     _nameController.text=userProvider.getUser.name;
    _emailController.text=userProvider.getUser.emailAddress;
    super.initState();
  }
  void _editProfile()async{
      
  }

  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery. of(context). size. width;
    width = width-78;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final userProvider = Provider.of<Users>(context);
    return Material(
       color: themeProvider.getBackgroundColor1,
      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          const CenterHeadingBar(title:"Profile Info"),
          const Divider(thickness: 2,),
          Container(
            decoration: BoxDecoration(color: themeProvider.getBackgroundColor1,),
            margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 22),
            child: Card(
              elevation: 1,
              child: Container(
                decoration: BoxDecoration(color: themeProvider.getcardBackgroundColor),
                padding: const EdgeInsets.only(top: 25,left: 20,right: 20,bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [userProvider.getUser.image==null ?const CircleAvatar(backgroundImage: AssetImage("assets/images/avtr.png"),radius: 45,):Text("null")],),
                      const SizedBox(height: 13,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,children: [TextWidget(text: "Edit profile picture", size:18, color:themeProvider.getPrimaryColor, weight:FontWeight.w400, lineheight:20),],),
                      const SizedBox(height: 40,),
                      const TextWidgetCommon(text: "Name"),
                      const SizedBox(height: 7.07,),
                      TextFields(controllers: _nameController, hinttext: "Enter your name",types: TextInputType.text,validate: true,erortext: "",),
                      const SizedBox(height: 20,),
                      const TextWidgetCommon(text: "Email Address"),
                      const SizedBox(height: 7.07,),
                      TextFields(controllers: _emailController, hinttext: "Example@gmail.com",types: TextInputType.emailAddress,validate: true,erortext: "",),
                      const SizedBox(height: 50,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,children: [ ButtonCustom(fontweight: FontWeight.w600, fontsize: 16, size: Size(width,50),borderCirculer: 8,backgroundColor:themeProvider.getPrimaryColor,text:"Save Changes",function:()=>_editProfile),],)
                  ]),
              ),
            ),
          )
        ],
      ),
    );
  }
  ElevatedButton ButtonCustom({required FontWeight fontweight, required double fontsize, required Size size,required double borderCirculer,required Color backgroundColor,required Function function,required String text}){
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(size),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderCirculer))),
        backgroundColor:MaterialStateProperty.all(backgroundColor)
        ),
      onPressed: ()async{
        final themeProvider = Provider.of<ThemeProvider>(context,listen: false);
        final userProvider = Provider.of<Users>(context,listen: false);
        if(_nameController.text.isNotEmpty && _emailController.text.isNotEmpty){
            userProvider.changeUserName(_nameController.text);
            userProvider.changeEmail(_emailController.text);
            await showDialog(
              context: context,
              builder: (context) => Dialog1(
              content: SizedBoxDialogDone(themeProvider: themeProvider,label: "Changes Saved",widgets: themeProvider.getThemeMode ?Image.asset("assets/icons/tickcircledark.png",height: 75,width: 75,): Image.asset("assets/icons/tick-circle.png",height: 75,width: 75,),))
          );
        }     
      },
      child: Text(text,style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontSize: fontsize),),
      );
  }
  
}