import 'package:flutter/material.dart';
import 'package:giftminder/components/commonHeader.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/constant/const.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/provider/user.dart';
import 'package:provider/provider.dart';

class Calenders extends StatefulWidget {
  const Calenders({ Key? key }) : super(key: key);

  @override
  _CalendersState createState() => _CalendersState();
}

class _CalendersState extends State<Calenders> {

  String? _month;
  num? _year;

  @override
  void initState() {
     final date = Provider.of<Users>(context,listen: false);
     YearMonth obj = date.getYearMonth as YearMonth;
     _month = obj.month;
     _year = obj.year;

    super.initState();
  }
  YearMonth numToDandM(int nums){
     int quotient = nums~/12;
     int reminder = nums-(nums~/12)*12;
     String month = reminder==0?"January":reminder==1?"Febraury":reminder==2?"March":reminder==3?"April":reminder==4?"May":reminder==5 ? "June": reminder==6?"July" :reminder==7 ?"August" :reminder==8 ? "September" :reminder==9?"October" :reminder==10?"Novermber" : "December";
     return YearMonth(month:month, year:quotient,monthNo: reminder+1);

  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final date = Provider.of<Users>(context);
    return Material(
      color: themeProvider.getBackgroundColor1,
      child: Column(children:[
         const CenterHeadingBar(title: "Month & year"),
         Padding(
           padding:const EdgeInsets.symmetric(horizontal:20,vertical: 20),
           child: Card(
            color: themeProvider.getcardBackgroundColor,              
             elevation: 2.5,
             shadowColor: Colors.black45,
             child: Container(  
                padding: const EdgeInsets.only(left: 25,right:25,top:24,bottom:60), 
               // height: 370,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          TextWidget(text: "$_month $_year", size: 19, color: themeProvider.getHeadingTextColor, weight:FontWeight.w600, lineheight:20),
                          const SizedBox(width: 10,),
                          InkWell(
                            child: Icon(Icons.arrow_forward_ios_outlined,color: themeProvider.getPrimaryColor,size: 20,),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            child: Icon(Icons.arrow_back_ios_new_outlined,color: themeProvider.getPrimaryColor,),
                          ),
                          const SizedBox(width: 20,),
                          InkWell(
                            child: Icon(Icons.arrow_forward_ios_outlined,color: themeProvider.getPrimaryColor,),
                          ),
                        ],
                      )     
                    ],
                  ),
                   const SizedBox(height: 10,),
                   Divider(color: themeProvider.getdividerColor,),
                   const SizedBox(height: 20,),
                   SizedBox(height: 200,
                    child: ListWheelScrollView(
                      onSelectedItemChanged: (value) {
                         YearMonth dateObj = numToDandM(DateConstant.dateCode[value]);
                         date.setYearMonth(obj: dateObj);
                         setState(() {
                           _month = dateObj.month;
                           _year=dateObj.year;
                         });

                        
                      },
                      itemExtent: 55,
                      //useMagnifier: true,
                      children: 
                        DateConstant.dateCode.map((e){
                        YearMonth object = numToDandM(e);
                         return  Padding(padding:const EdgeInsets.symmetric(horizontal:50),
                              child:ListTile(
                                onTap: () {
                                  print("tattatat");
                                  Navigator.of(context).pop(object);
                                },
                                title:TextWidget(text:"${object.month} ", size:17, color: themeProvider.getTextColor2, weight:FontWeight.w500, lineheight:15),
                                  
                                trailing: TextWidget(text:"${numToDandM(e).year}", size:17, color: themeProvider.getTextColor2, weight:FontWeight.w500, lineheight:15)
                                ), );
                        
                      }).toList()
                      
                     )
                  ), 
                ]),
             ),
           ),
         )
      ])
      
    );
  }
}

class YearMonth{
   num year;
   String month;
   num monthNo;
   YearMonth({required this.month,required this.year,required this.monthNo});
}