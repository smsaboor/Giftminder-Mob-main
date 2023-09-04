
import 'package:flutter/material.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/provider/user.dart';
import 'package:giftminder/routes.dart';
import 'package:provider/provider.dart';

class homeBar extends StatelessWidget {
 
   const homeBar({
    super.key,
    
  });

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<Users>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Card(
      elevation: 1,
      child: Container(
        decoration: BoxDecoration(gradient:themeProvider.getLinearGradientAppBar ),
        height: 120,
        padding: const EdgeInsets.only(top: 50,left: 30,right: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children:[
                  Text("Gift",style: TextStyle(fontSize: 27,fontWeight: FontWeight.w600,color:themeProvider.getPrimaryColor ),),
                  Text("Minder",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color:themeProvider.getHeadingTextColor2),)
                ]),
                Row(children: [
                    IconButton(onPressed: ()=>Navigator.pushNamed(context,Routes.notificationsScreen), icon: Icon(Icons.notifications_none,size: 30,color: themeProvider.getHeadingTextColor,)),
                    const SizedBox(width:7,),
                    InkWell(onTap:()=>Navigator.pushNamed(context,Routes.ownProfileRoute),
                      child:userProvider.getUser.image==null ?const CircleAvatar(backgroundImage: AssetImage("assets/images/avtr.png"),radius:18,):Text("null")
                  )
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
