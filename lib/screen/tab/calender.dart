import 'package:flutter/material.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/provider/user.dart';
import 'package:giftminder/routes.dart';
import 'package:giftminder/screen/components/headerHome.dart';
import 'package:giftminder/screen/tab/calenders.dart';
import 'package:provider/provider.dart';

class Calender extends StatefulWidget {
  const Calender({ Key? key }) : super(key: key);

  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {

  String? _month;
  num? _year;
  @override
  void initState() {
     final date = Provider.of<Users>(context,listen: false);
     YearMonth obj = date.getYearMonth as YearMonth;
     _month = obj.month;
     _year = obj.year;
     var now = DateTime.now();
     var beginningNextMonth = (now.month < 12) ? new DateTime(now.year, now.month + 1, 1) : new DateTime(now.year + 1, 1, 1);
     var lastDay = beginningNextMonth.subtract(new Duration(days: 1)).day;
     startingDate = DateTime(obj.year as int,obj.monthNo as int,0).weekday-6;
     lastMonthday = lastDay;
     super.initState();
  }

  int startingDate = -4;
  int lastMonthday = 31;
  String finalDate = '';
  

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    print(finalDate);
    return Material(
      color: themeProvider.getBackgroundColor1,
      child: SingleChildScrollView(
        child: Column(children:[
           const homeBar(),
           Padding(
             padding:const EdgeInsets.symmetric(horizontal:20,vertical: 20),
             child: Card(
              color: themeProvider.getcardBackgroundColor,              
               elevation: 2.5,
               shadowColor: Colors.black45,
               child: Container(padding: const EdgeInsets.symmetric(horizontal: 25,vertical:24), 
                  height: 350,
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                        Row(children: [
                            TextWidget(text: "$_month $_year", size: 19, color: themeProvider.getHeadingTextColor, weight:FontWeight.w600, lineheight:20),
                            const SizedBox(width: 10,),
                            InkWell(onTap: (){
                                Navigator.pushNamed(context,Routes.calenderSelect).then((value){
                                  final date = Provider.of<Users>(context,listen: false);
                                  YearMonth obj = date.getYearMonth as YearMonth;
                                  _month = obj.month;
                                  _year = obj.year;
                                  startingDate = DateTime(obj.year as int,obj.monthNo as int,0).weekday-6;
                                  setState(() { });
                                });
                              },
                              child: Icon(Icons.arrow_forward_ios_outlined,color: themeProvider.getPrimaryColor,size: 20,),
                            ),
                          ],
                        ),
                        Row(children: [
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
                    
                    Divider(thickness: 1,color: themeProvider.getdividerColor,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        dayLabelTextWidget(themeProvider,"SUN"),
                        dayLabelTextWidget(themeProvider,"MON"),
                        dayLabelTextWidget(themeProvider,"TUE"),
                        dayLabelTextWidget(themeProvider,"WED"),
                        dayLabelTextWidget(themeProvider,"THU"),
                        dayLabelTextWidget(themeProvider,"FRI"),
                        dayLabelTextWidget(themeProvider,"SAT"),
                    ],),
                    const SizedBox(height: 2,),
                      firstDateRow(themeProvider,startingDate),
                      dateRow(themeProvider,startingDate+7,lastMonthday),
                      dateRow(themeProvider,startingDate+14,lastMonthday),
                      dateRow(themeProvider,startingDate+21,lastMonthday),
                      dateRow(themeProvider,startingDate+28,lastMonthday),
                      dateRow(themeProvider,startingDate+35,lastMonthday),
                      const SizedBox(height: 1,),
                  ]),
               ),
             ),
           ),
          SizedBox(height: 250,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(padding: EdgeInsets.symmetric(horizontal:23),
                     child: EventByDateCard(),
                   );
                },
              ),
          )
          
           
        ]),
      )
      
    );
  }

  Row dateRow(ThemeProvider themeProvider,int start,int maxMonthDay) {
    int index =start+1;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(width: 22, child: dateLabelTextWidget(themeProvider,"${index<=maxMonthDay ? index<10 ? " ${index++}":index++ : ""}")),
        SizedBox(width: 22, child: dateLabelTextWidget(themeProvider,"${index<=maxMonthDay ? index<10 ? " ${index++}":index++ : ""}")),
        SizedBox(width: 22, child: dateLabelTextWidget(themeProvider,"${index<=maxMonthDay ? index<10 ? " ${index++}":index++ : ""}")),
        SizedBox(width: 22, child: dateLabelTextWidget(themeProvider,"${index<=maxMonthDay ? index<10 ? " ${index++}":index++ : ""}")),
        SizedBox(width: 22, child: dateLabelTextWidget(themeProvider,"${index<=maxMonthDay ? index<10 ? " ${index++}":index++ : ""}")),
        SizedBox(width: 22, child: dateLabelTextWidget(themeProvider,"${index<=maxMonthDay ? index<10 ? " ${index++}":index++ : ""}")),
        SizedBox(width: 22, child: dateLabelTextWidget(themeProvider,"${index<=maxMonthDay ? index<10 ? " ${index++}":index++ : ""}")),
      ],);
  }
  Row firstDateRow(ThemeProvider themeProvider,int start) {
    int index =start;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(width: 22, child: dateLabelTextWidget(themeProvider,"${index++<0?" ":index}")),
        SizedBox(width: 22, child: dateLabelTextWidget(themeProvider,"${index++<0?" ":index}")),
        SizedBox(width: 22, child: dateLabelTextWidget(themeProvider,"${index++<0?" ":index}")),
        SizedBox(width: 22, child: dateLabelTextWidget(themeProvider,"${index++<0?" ":index}")),
        SizedBox(width: 22, child: dateLabelTextWidget(themeProvider,"${index++<0?" ":index}")),
        SizedBox(width: 22, child: dateLabelTextWidget(themeProvider,"${index++<0?" ":index}")),
        SizedBox(width: 22, child: dateLabelTextWidget(themeProvider,"${index++<0?" ":index}")),
       
       
      ],);
  }

  TextWidget dayLabelTextWidget(ThemeProvider themeProvider,String label) => TextWidget(text:label, size:14, color: themeProvider.getTextColor2, weight:FontWeight.w600, lineheight:15);
  TextWidget dateLabelTextWidget(ThemeProvider themeProvider,String label) => TextWidget(text:label, size:14, color: themeProvider.getTextColor2, weight:FontWeight.w600, lineheight:15);

}


class EventByDateCard extends StatefulWidget {
  const EventByDateCard({ Key? key }) : super(key: key);

  @override
  _EventByDateCardState createState() => _EventByDateCardState();
}

class _EventByDateCardState extends State<EventByDateCard> {

  String personName = "Daula Paulson";
  String eventName = "Birthday";

  @override
  Widget build(BuildContext context) {
     final themeProvider = Provider.of<ThemeProvider>(context);

    return Card(
      color: themeProvider.getcardBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
        child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [
                 ImageWidget(url: "",),
                 const SizedBox(width: 10,),
                 TextWidget(text:personName, size:18, color:themeProvider.getHeadingTextColor, weight:FontWeight.w400, lineheight:19)
              ],),
              InkWell(child: Icon(Icons.arrow_forward_ios,color: themeProvider.getHeadingTextColor,),)
              
            ],),
            const SizedBox(height: 10,),
            Row(children: [
                 TextWidget(text: "Event   :", size: 16, color:themeProvider.getTextColor1, weight:FontWeight.w500, lineheight:17),
                 const SizedBox(width: 15,),
                 themeProvider.getThemeMode ? Image.asset("assets/icons/cakeblue.png",width: 24,) :Image.asset("assets/icons/cake.png",width: 24),
                 const SizedBox(width: 12,),
                 TextWidget(text:eventName, size:18, color:themeProvider.getHeadingTextColor, weight:FontWeight.w400, lineheight:19)
              ],),
            const SizedBox(height:5,),

            Divider(color: themeProvider.getdividerColor,),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              InkWell(child: TextWidget(text: "Buy Gifts", size: 16, color:themeProvider.getPrimaryColor, weight:FontWeight.w500, lineheight:17))
            ],)
        ],),
      ),
    );
  }
}


class ImageWidget extends StatelessWidget {
 String url ;
  ImageWidget({required this.url});

  @override
  Widget build(BuildContext context){
    return const CircleAvatar(backgroundImage: AssetImage("assets/images/avtr.png"),);
    
  }
}