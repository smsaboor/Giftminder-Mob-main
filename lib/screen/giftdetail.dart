import 'package:flutter/material.dart';
import 'package:giftminder/components/button.dart';
import 'package:giftminder/components/commonHeader.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/model/gift.dart';
import 'package:giftminder/provider/giftsprovider.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/routes.dart';
import 'package:giftminder/screen/components/commonPriceComponent.dart';
import 'package:giftminder/screen/components/giftCard.dart';
import 'package:giftminder/theme/color.dart';
import 'package:provider/provider.dart';

class Giftdetail extends StatefulWidget {
  const Giftdetail({ Key? key }) : super(key: key);

  @override
  _GiftdetailState createState() => _GiftdetailState();
}

class _GiftdetailState extends State<Giftdetail> {
  @override
  Widget build(BuildContext context) {

    final gift = ModalRoute.of(context)!.settings.arguments as Gift;


    final themeProvider = Provider.of<ThemeProvider>(context);
    return Material(
      color: themeProvider.getBackgroundColor2,
      child: SingleChildScrollView(
        child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          CenterHeadingBar(title:gift.giftName),
          Image.asset("assets/images/r11.png",height: 390),
          const SizedBox(height: 15,),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [TextWidget(text: gift.giftName, size:22, color:themeProvider.getHeadingTextColor, weight:FontWeight.w600, lineheight:23)],),
          const SizedBox(height:5,),
          Divider(color:themeProvider.getdividerColor,thickness: 1,),
          DiscountComponent(gift:gift),
          ProductGiftDetail(gift:gift),
          Divider(color: themeProvider.getdividerColor,thickness: 1,),
          SimiliarGift()

        ],
      ),
      )
    );
  }
}

class SimiliarGift extends StatefulWidget {
  const SimiliarGift({ Key? key }) : super(key: key);

  @override
  _SimiliarGiftState createState() => _SimiliarGiftState();
}

class _SimiliarGiftState extends State<SimiliarGift> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final giftProvider = Provider.of<Gifts>(context);
    final gifts = giftProvider.getSimiliarGift;
    return Padding(padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            TextWidget(text:"Similiar Product", size:23, color:themeProvider.getHeadingTextColor, weight:FontWeight.w600, lineheight:24),
            const SizedBox(height: 20,),
            SizedBox(
              height: 250,
              child:  GridView.builder(
                itemCount: gifts.length,
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 230,childAspectRatio: 3 / 2,crossAxisSpacing: 20,mainAxisSpacing: 20),
                itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.of(context).pushNamed(Routes.giftItemRoute,arguments: gifts[index]),
                      child: GiftCard(gift: gifts[index]),
                );
            },  
          ),
        )   
      ],
    )
    );
  }
}

class ProductGiftDetail extends StatefulWidget {
  Gift gift;
  ProductGiftDetail({required this.gift});

  @override
  _ProductGiftDetailState createState() => _ProductGiftDetailState();
}

class _ProductGiftDetailState extends State<ProductGiftDetail> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(padding:const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(text:"Product detail", size:23, color:themeProvider.getHeadingTextColor, weight:FontWeight.w600, lineheight:24),
            const SizedBox(height: 10,),
            newRow(themeProvider,"Brand",widget.gift.brand),
            newRow(themeProvider,"Material",widget.gift.material),
            newRow(themeProvider,"Proof",widget.gift.proof),
            newRow(themeProvider,"Weight","${widget.gift.weight} gram"),
          ],
        ),
    );
  }

  Padding newRow(ThemeProvider themeProvider,String label,String data)=>Padding(padding: const EdgeInsets.only(top: 16,bottom: 16),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [TextWidget(text:label, size:15, color:themeProvider.getTextColor1, weight:FontWeight.w600, lineheight:24),TextWidget(text:"$data", size:15, color:themeProvider.getHeadingTextColor, weight:FontWeight.w600, lineheight:24),const SizedBox(width: 10,),const SizedBox(width: 10,)]));
  
}

class DiscountComponent extends StatefulWidget {
  Gift gift;
  DiscountComponent({required this.gift});

  @override
  _DiscountComponentState createState() => _DiscountComponentState();
}

class _DiscountComponentState extends State<DiscountComponent> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    width = width-60.90;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(children: [
           Row(children: [
            Padding(padding: const EdgeInsets.only(left: 30,top: 20,bottom: 40),
            child:CommonPriceComponent(gift:widget.gift),
            )
           ],),
           ButtonCategory1(fontweight: FontWeight.w600, fontsize: 16, size: Size(width, 50),borderCirculer: 8,borderSideColor: ConstantColor.ButtonBorderColor,backgroundColor:themeProvider.getPrimaryColor,text:"Buy Now",
                    function:()=>Navigator.of(context).pushNamed(Routes.selectAddress,arguments:widget.gift )),
          const SizedBox(height: 30,),
          Divider(color: themeProvider.getdividerColor,thickness:1,)
      ]);
  }
}
