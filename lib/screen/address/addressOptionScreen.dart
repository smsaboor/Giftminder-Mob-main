import 'package:flutter/material.dart';
import 'package:giftminder/components/button.dart';
import 'package:giftminder/components/commonHeader.dart';
import 'package:giftminder/components/postiostack.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/model/address.dart';
import 'package:giftminder/provider/addresses.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/routes.dart';
import 'package:giftminder/components/SizedBoxDialogDone.dart';
import 'package:giftminder/screen/components/eventCard.dart';
import 'package:giftminder/theme/color.dart';
import 'package:provider/provider.dart';

class AddressOptionScreen extends StatefulWidget {
  const AddressOptionScreen({ Key? key }) : super(key: key);

  @override
  _AddressOptionScreenState createState() => _AddressOptionScreenState();
}

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class _AddressOptionScreenState extends State<AddressOptionScreen> {
  BestTutorSite _site = BestTutorSite.javatpoint;
  bool vall= true;
  
  @override
   Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    width = width-60.90;
    //final gift = ModalRoute.of(context)!.settings.arguments as Gift;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final addressProvider = Provider.of<Addresses>(context);
    return Material(
      color: themeProvider.getBackgroundColor2,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              const CenterHeadingBar(title:"Add Address"),
              Container(
                padding: const EdgeInsets.symmetric(horizontal:23,vertical: 25),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [TextWidget(text: "Select Address", size:23, color:themeProvider.getHeadingTextColor , weight: FontWeight.w700, lineheight:24),
                                  InkWell(onTap: () => Navigator.pushNamed(context,Routes.addNewAddress), child: Icon(Icons.add_circle_outline_sharp,color: themeProvider.getPrimaryColor,size: 40,),)
                    ],),
                    const SizedBox(height: 25,),
                    SizedBox(height: 500,
                    child: ListView.builder(
              
                      itemCount: addressProvider.getAddress.length,
                      itemBuilder: (context, index) {
                        return Container(margin: const EdgeInsets.only(top:10),child: AddressCard(index:index, address: addressProvider.getAddress[index]),);
                      },
                    ),),

                    const SizedBox(height: 40,),
                    ButtonCategory1(fontweight: FontWeight.w600, fontsize: 16, size: Size(width, 50),borderCirculer: 8,borderSideColor: ConstantColor.ButtonBorderColor,backgroundColor:themeProvider.getPrimaryColor,text:"Add Address",
                      function:(){}
                    ),
                ]),
              )
  
      ]),
    );
  }
}


class AddressCard extends StatefulWidget {
  Address address;
  int index;
  AddressCard({required this.index, required this.address});

  @override
  _AddressCardState createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {

void _deleteAddress()async{
    final themeProvider = Provider.of<ThemeProvider>(context,listen: false);
    bool work = false;
    await showDialog(
        context: context,
        builder: (context) => Dialog1(
          content: Stack(
          children: [
            const PositionStack(),
            SizedBoxDialogDone(themeProvider: themeProvider,label: "Are you sure you want to delete ${widget.address.personName} address",widgets: themeProvider.getThemeMode ?Image.asset("assets/icons/deletedark.png",height: 75,width: 75,): Image.asset("assets/icons/delete.png",height: 75,width: 75,))
          ],))).then((value){
            work =value;
       });
       if(work==false){
         return;
       }
      // ignore: use_build_context_synchronously
      Provider.of<Addresses>(context,listen: false).deleteAddressAtIndex(widget.index);
  }
  void _editAddress(){
      Navigator.of(context).pushNamed(Routes.addNewAddress,arguments:AddressArguments(widget.index,false,"Save Address"));
  }
  BestTutorSite _site = BestTutorSite.javatpoint;
  bool vall= true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    width = width-60.90;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Card(
          child: Column(
            children: [
              Container(padding: const EdgeInsets.only(left: 25,right: 25,top: 15), decoration: BoxDecoration(color: themeProvider.getcardBackgroundColor),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [TextWidget(text:widget.address.personName, size:18, color:themeProvider.getHeadingTextColor , weight: FontWeight.w700, lineheight:24),
                  Radio(  
                    fillColor:MaterialStateColor.resolveWith((states) => themeProvider.getPrimaryColor),
                    value: BestTutorSite.javatpoint,  
                    groupValue: _site,  
                    onChanged: (BestTutorSite? value) {  
                      // vall =true;
                      setState(() {  
                      _site = value as BestTutorSite;  
                      });
                    },  
                  ),
              ],),
              SizedBox(height:60, child: TextWidget(text:widget.address.fullAddress, size:15, color:themeProvider.getTextColor1, weight:FontWeight.w500, lineheight:16)),
              SizedBox(height:20, child: TextWidget(text: "Zip code : ${widget.address.zipCode}", size:15, color:themeProvider.getTextColor1, weight:FontWeight.w500, lineheight:16)),
              const Divider(thickness:0.5,),
              ]),
            ),
            Container(
              padding:const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(color: themeProvider.getcardBackgroundColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(onTap:_deleteAddress,
                    child: TextWidget(text: "Delete", size: 18, color:themeProvider.getThemeMode? const Color.fromRGBO(251, 71, 103, 1):Color.fromRGBO(0,0,0,1), weight:FontWeight.w500, lineheight:17),
                  ),
                  VerticalDivider(thickness: 1,color:themeProvider.getHeadingTextColor),
                  InkWell(onTap:_editAddress,child: TextWidget(text: "Edit", size: 18, color:themeProvider.getPrimaryColor, weight:FontWeight.w500, lineheight:17),
                    ),
                ],),
              )
            ],
         ),
       );
  }
}


