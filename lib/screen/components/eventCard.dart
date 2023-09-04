import 'package:flutter/material.dart';
import 'package:giftminder/components/postiostack.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/provider/eventProvider.dart';
import 'package:giftminder/routes.dart';
import 'package:giftminder/screen/eventsInputScreen.dart';
import 'package:provider/provider.dart';

class EventCard extends StatefulWidget {

  String birthday;
  int    reminder;
  String intrest1;
  String intrest2;
  String intrest3;
  String eventId;
  String personName;
  String eventType;
  EventCard({required this.eventType, required this.personName, required this.eventId, required this.birthday,required this.intrest1,required this.intrest2,required this.intrest3,required this.reminder});

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {



  void deleteEvent()async{
    bool work = false;
    await showDialog(
        context: context,
        builder: (context) => Dialog1(
          content: Stack(
          children: [
            const PositionStack(),
            SizedBox(
              height: 200,
              width: 320,
              child: Column(children: [
                  Image.asset("assets/icons/delete.png",height: 75,width: 75,),
                  const SizedBox(height: 14,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    //$name $eventType
                    child: Text("Are you sure you want to delete ${widget.personName} ${widget.eventType} info?",textAlign: TextAlign.center, style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                  ),
                  const Divider(),
                  TextButton(
                  child: const Text('Delete',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color.fromRGBO(217, 89, 136, 1)),),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],),
            ),
          ],))).then((value){
            work =value;
       });
       if(work==false){
         return;
       }
      // ignore: use_build_context_synchronously
      Provider.of<Events>(context,listen: false).deleteEvent(widget.eventId);
  }
  void editEvent(){
      Navigator.of(context).pushNamed(Routes.eventsInputScreenRoute,arguments:widget.eventId);
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery. of(context). size. width;
    width = width-70;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Card(
      color:themeProvider.getcardBackgroundColor,
      child: Container(
        padding: const EdgeInsets.only(right: 15, left: 15,top: 20,bottom: 18),
        child: Column(children: [
            Row(children: [
                //if(widget.eventType=="Birthday")?
                themeProvider.getThemeMode ? Image.asset("assets/icons/cakeblue.png"):Image.asset("assets/icons/cakepink.png"),
                const SizedBox(width: 13,), 
                TextWidget(text:widget.eventType, size:23, color:themeProvider.getPrimaryColor,weight:FontWeight.w500, lineheight:23)
                ],
            ),
            const SizedBox(height: 25,),
            rowWidget(text: "Event date",data:widget.birthday),
            const SizedBox(height: 15,),
            rowWidget(text: "Reminder",data:"${widget.reminder} days before"),
            const SizedBox(height: 25,),
            rowWidget2(width: width,label: widget.intrest1),
            const SizedBox(height: 15,),
            rowWidget2(width: width,label:widget.intrest2),
            const SizedBox(height: 15,),
            rowWidget2(width: width, label:widget.intrest3),
            const SizedBox(height: 20,),
            const Divider(thickness:0.5,),
            Container(
              padding:const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(color: themeProvider.getBackgroundColor1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap:deleteEvent,
                    child: TextWidget(text: "Delete", size: 18, color:themeProvider.getThemeMode? const Color.fromRGBO(251, 71, 103, 1):Color.fromRGBO(0,0,0,1), weight:FontWeight.w500, lineheight:17),
                  ),
                  VerticalDivider(thickness: 1,color:themeProvider.getHeadingTextColor),
                  InkWell(
                    onTap: editEvent,
                    child: TextWidget(text: "Edit", size: 18, color:themeProvider.getPrimaryColor, weight:FontWeight.w500, lineheight:17),
                  ),
              ],),
            )
          ]),
       )
     );
  }
  Container rowWidget2({required double width,required String label}) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Container(
      decoration: BoxDecoration(
        color: themeProvider.getBackgroundColor1,
        borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(left:21.0,top: 14,bottom: 14,right: 21),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,style:TextStyle(color:themeProvider.getHeadingTextColor,fontSize: 18,fontWeight: FontWeight.w500),),    
            const Visibility(visible: false, child:Icon(Icons.arrow_forward_ios),)
          ],
        ),
      ),
    );
  }

  Row rowWidget({required String text,required String data}){
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Row(
      children:[
          TextWidget(text:text, size:16, color: themeProvider.getTextColor2, weight: FontWeight.w500, lineheight:17),
          const SizedBox(width: 13,),
          TextWidget(text:":", size:16, color: themeProvider.getTextColor2, weight: FontWeight.w500, lineheight:17),
          const SizedBox(width: 13,),
          TextWidget(text:data, size:18, color:themeProvider.getHeadingTextColor, weight: FontWeight.w500, lineheight:17),
        ],
    );
  }
}

class Dialog1 extends StatefulWidget {
  _Dialog1State createState() => _Dialog1State();
  Widget content ;
  Dialog1({required this.content});
}

class _Dialog1State extends State<Dialog1> {
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: widget.content
    );
  }
}