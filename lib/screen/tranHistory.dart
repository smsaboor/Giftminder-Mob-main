import 'package:flutter/material.dart';
import 'package:giftminder/components/commonHeader.dart';
import 'package:giftminder/components/networkImage.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/model/gift.dart';
import 'package:giftminder/model/transaction.dart';
import 'package:giftminder/provider/giftsprovider.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/provider/transactions.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class TranHistory extends StatefulWidget {
  const TranHistory({ Key? key }) : super(key: key);

  @override
  _TranHistoryState createState() => _TranHistoryState();
}

class _TranHistoryState extends State<TranHistory> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    width = width-60.90;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final transactionProvider =  Provider.of<Transactions>(context);
    final giftProvider =  Provider.of<Gifts>(context,listen: false);
    
    return Material(
      color: themeProvider.getBackgroundColor2,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children:[
          const CenterHeadingBar(title:"Purchase history"),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 25),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: "My orders", size:23, color:themeProvider.getHeadingTextColor , weight: FontWeight.w700, lineheight:24),
                SizedBox(
                  height: 628,
                  child: ListView.builder(
                    itemCount: transactionProvider.getTransactionList.length,
                    itemBuilder: (context, index) {
                      return TransactionWidget(transaction:transactionProvider.getTransactionList[index] , index: index, giftProvider: giftProvider, transactionProvider: transactionProvider, themeProvider: themeProvider);
                    },
                  ),
                )
                
               
            ]),
          )
      ]),
    );
  }
}

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({
    super.key,
    required this.transaction,
    required this.index,
    required this.giftProvider,
    required this.transactionProvider,
    required this.themeProvider,
  });
  final int index;
  final Gifts giftProvider;
  final Transactions transactionProvider;
  final ThemeProvider themeProvider;
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    Gift gift = giftProvider.getGiftById(id: transactionProvider.getTransactionList[index].productId);
    return Column(children: [
      const SizedBox(height: 20,),
      Row(children: [
          NetworkImg(url:gift.giftImageUrl[0], height:77, width:77),
          Padding(padding:const EdgeInsets.only(left: 25),
            child:Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                TextWidget(text:gift.giftName, size:18, color:themeProvider.getHeadingTextColor, weight:FontWeight.w600, lineheight:19),
                const SizedBox(height: 6,),
                TextWidget(text:"Purchased on ${DateFormat.yMd().format(transaction.dataTime)}", size:13, color:themeProvider.getTextColor1, weight:FontWeight.w500, lineheight:19),
                const SizedBox(height: 10,),
                TextWidget(text:"For ${transaction.eventForPurchase}", size:15, color:themeProvider.getPrimaryColor, weight:FontWeight.w500, lineheight:19)
            ],),
          )
      ],),//{}
      const SizedBox(height: 20,),
      Divider(thickness: 1,color: themeProvider.getdividerColor,)
    ]);
  }
}