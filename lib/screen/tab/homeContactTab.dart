
import 'package:flutter/material.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/constant/Strings.dart';
import 'package:giftminder/provider/contactProvider.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/routes.dart';
import 'package:giftminder/screen/components/card.dart';
import 'package:giftminder/screen/components/headerHome.dart';
import 'package:giftminder/components/memoryimg.dart';
import 'package:giftminder/components/searchField.dart';
import 'package:giftminder/services/contactService.dart';
import 'package:provider/provider.dart';

class HomeContactTab extends StatefulWidget {
  const HomeContactTab({ Key? key }) : super(key: key);

  @override
  _HomeContactTabState createState() => _HomeContactTabState();
}

class _HomeContactTabState extends State<HomeContactTab> {

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
     final contactProvider = Provider.of<Contacts>(context);
    return Material(
      color:themeProvider.getBackgroundColor1,
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const homeBar(),
            const SizedBox(height: 12,),
            const SearchField(),
            Padding(padding:const  EdgeInsets.only(left: 30,right: 20,top:15),child:TextWidget(text: "All Contacts", size:25, color:themeProvider.getHeadingTextColor, weight: FontWeight.w600, lineheight: 20)),
            Container(
              decoration: BoxDecoration(color: themeProvider.getcardBackgroundColor),
              margin: const EdgeInsets.only(left: 30,right: 20,top: 15),
              child:FutureBuilder(
                future: ContactServices.checkPermission,
                builder: (context, snapshot) {
                    if(snapshot.data==true){
                      return FutureBuilder(
                        future:contactProvider.getContact() ,
                        builder: (context, snapshot){
                          if(snapshot.connectionState==ConnectionState.waiting){
                            return const Padding(padding:EdgeInsets.symmetric(horizontal: 50,vertical: 200),child: Center(child: CircularProgressIndicator(),),);
                          }
                          if(snapshot.hasData){
                            return SizedBox(
                            height: 510,
                            child: ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  print(index);
                                  return Column(
                                    children: [
                                      ListTile(                      
                                        selected: false,
                                        leading: MemoryImg(radius: 22,bytes: snapshot.data![index].avatar),
                                        //leading: MemoryImg(radius:22,bytes:snapshot.data![index].avatar),
                                        title:  TextWidget(text: "${snapshot.data![index].displayName}", size:18, color:themeProvider.getHeadingTextColor, weight: FontWeight.w400, lineheight: 20),
                                        trailing:IconButton(
                                          onPressed: () {
                                              Navigator.pushNamed(context,Routes.profileRoute,arguments:snapshot.data![index]);
                                          },
                                          icon:Icon(Icons.arrow_forward_ios_sharp,color: themeProvider.getTextColor2,),)
                                      ),
                                      Divider(thickness:0.5,color: themeProvider.getdividerColor,),
                                  ],
                                );
                              }),
                            );
                          }else{
                              return const Text("No Cotacts on Device");
                          }
                        }
                      );
                    }else{
                      return CardHome(
                      widgetRow1: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed:()async {if (await ContactServices.askPermission()) {setState(() {});}},
                              icon:Icon(Icons.add_circle_outline,size: 70,color:themeProvider.getPrimaryColor)),
                            const SizedBox(width: 40,)],
                          ),
                      widgetRow2: const Text("Import contacts",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                      widgetRow3:Text(ConstantString.notImportedContact,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color:themeProvider.getTextColor2),
                      ),
                    ); 
                  }                  
                },
            ),
          )
        ]),
      ),
    );
  }
}