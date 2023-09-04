import 'package:flutter/material.dart';
import 'package:giftminder/components/button.dart';
import 'package:giftminder/components/commonHeader.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/model/gift.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/provider/transactions.dart';
import 'package:giftminder/routes.dart';
import 'package:giftminder/screen/components/commonPriceComponent.dart';
import 'package:giftminder/screen/components/rowtextbutton.dart';
import 'package:giftminder/theme/color.dart';
import 'package:provider/provider.dart';

class SelectAdress extends StatefulWidget {
  const SelectAdress({ Key? key }) : super(key: key);

  @override
  _SelectAdressState createState() => _SelectAdressState();
}

class _SelectAdressState extends State<SelectAdress> {
  int numOfItem =1;
  void incre(){
    numOfItem++;
  }
  void decre(){
    if(numOfItem==0){
      return;
    }
    numOfItem--;
  }
  void buyGiftItem(){
      final gift = ModalRoute.of(context)!.settings.arguments as Gift;
      final transactionProvider =  Provider.of<Transactions>(context,listen: false);
      transactionProvider.addTransaction(eventForPurchase:"Birthday", dataTime:DateTime.now(), price:gift.discountedPrice, productId:gift.giftId, transactionId:"unique");
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    width = width-60.90;
    final gift = ModalRoute.of(context)!.settings.arguments as Gift;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Material(
      color: themeProvider.getBackgroundColor2,
      child: Column(children:[
           const CenterHeadingBar(title:"Select Address"),
           SelectAdressProduct(gift: gift,incre: incre,decre: decre,),
           Divider(thickness: 1,color: themeProvider.getdividerColor,),
           const SizedBox(height:14,),
           RowTextIconButton(func:()=>Navigator.pushNamed(context,Routes.selectAddressOptionRoute), iconsize:30, textsize:18, themeProvider: themeProvider,label: "Add Address",),
           const SizedBox(height: 50,),
           ButtonCategory1(fontweight: FontWeight.w600, fontsize: 16, size: Size(width, 50),borderCirculer: 8,borderSideColor: ConstantColor.ButtonBorderColor,backgroundColor:themeProvider.getPrimaryColor,text:"Continue to Payment",
            function:buyGiftItem
          ),
      ]),
    );
  }
}

class SelectAdressProduct extends StatefulWidget {
  Function incre;
  Function decre;
  Gift gift;
  SelectAdressProduct({super.key, required this.gift,required this.decre,required this.incre});
  @override
  _SelectAdressProductState createState() => _SelectAdressProductState();
}

class _SelectAdressProductState extends State<SelectAdressProduct> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 30),
      child: Column(children: [
         Row(children: [
          Image.asset("assets/images/r11.png",height: 150,width:120,fit: BoxFit.fill,),
          Padding(padding: const EdgeInsets.only(left: 20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text:" ${widget.gift.giftName}", size:20, color:themeProvider.getHeadingTextColor, weight:FontWeight.w600, lineheight:21),
                const SizedBox(height: 12,),
                CommonPriceComponent(gift: widget.gift,),
                const SizedBox(height: 23,),
                IncreDecreButton(incre: widget.incre,decre: widget.decre,)
              ],
            ),)
         ],)
      ],)
      
    );
  }
}

