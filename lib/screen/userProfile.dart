import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:giftminder/constant/Strings.dart';
import 'package:giftminder/model/contact.dart';
import 'package:giftminder/model/event.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/components/memoryimg.dart';
import 'package:giftminder/screen/components/rowtextbutton.dart';
import 'package:giftminder/components/commonHeader.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/provider/eventProvider.dart';
import 'package:giftminder/routes.dart';
import 'package:giftminder/screen/components/card.dart';
import 'package:giftminder/screen/components/eventCard.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({ Key? key }) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ContactUser;
    double height = MediaQuery.of(context).size.height;
    var text = args.displayName as String;
    String trancated;
    try {trancated = text.replaceRange(17, text.length, '...');} catch (e) {trancated = text;}
    final handler = Provider.of<Events>(context);
    bool isAnyEvent = handler.isAnyEventRegisteredOnThatPerson(text);
    final events = handler.eventByPerson(text);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Material(
      child: SingleChildScrollView(
        child: Container(decoration: BoxDecoration(color:themeProvider.getBackgroundColor1,),height: height,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CenterHeadingBar(title:trancated),
            ProfileCard(phoneNo:"${args.phones![0].value}", trancated: trancated, bytes:args.avatar as Uint8List),
            isAnyEvent ? RowTextIconButton(label:  "Gift Interest", themeProvider: themeProvider,iconsize: 42,textsize: 24,func: ()=>Navigator.of(context).pushNamed(Routes.eventsInputScreenRoute,arguments: args.displayName),)
            :Padding(padding: const EdgeInsets.symmetric(horizontal:25 ), child:TextWidget(text: "Gift Interest", size: 24, color:themeProvider.getHeadingTextColor, weight:FontWeight.w600, lineheight:26)),
            isAnyEvent ? EventContainer(themeProvider: themeProvider, events: events, trancated: trancated)
            : NoEventContainer(args: args, themeProvider: themeProvider)
          ]),
        ),
      )
    );
  }
}

class EventContainer extends StatelessWidget {
  const EventContainer({
    super.key,
    required this.themeProvider,
    required this.events,
    required this.trancated,
  });

  final ThemeProvider themeProvider;
  final List<Event> events;
  final String trancated;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: themeProvider.getcardBackgroundColor),
      height: 330,
      margin:const EdgeInsets.only(left: 20,right: 20,top: 8),
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return EventCard(eventType: events[index].events, personName: trancated, eventId: events[index].eventId, birthday:"${DateFormat.yMd().format(events[index].eventDate)}" ,reminder: events[index].reminderDay,intrest1:events[index].interest[0],intrest2:events[index].interest[1],intrest3:events[index].interest[2]);
        },
      )
     );
  }
}

class NoEventContainer extends StatelessWidget {
  const NoEventContainer({
    super.key,
    required this.args,
    required this.themeProvider,
  });

  final ContactUser args;
  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: CardHome(
          widgetRow1: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap:() {
                  Navigator.of(context).pushNamed(Routes.eventsInputScreenRoute,arguments: args.displayName);
                },
                child:Icon(Icons.add_circle_outline,size: 70,color:themeProvider.getPrimaryColor),
              ),
            ],
          ),
          widgetRow2:Text("Add Events",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: themeProvider.getHeadingTextColor)),
          widgetRow3:Text(ConstantString.notAddedAnyEvent,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color:themeProvider.getTextColor2),
          ),
        ),
    );
  }
}



class ProfileCard extends StatefulWidget {
  Uint8List bytes ;
  String phoneNo;
  ProfileCard({required this.phoneNo, required this.trancated,required this.bytes});
  String trancated;
  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Card(
      color: themeProvider.getcardBackgroundColor,
      elevation:2,
      margin: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
        child: Column(children: [
            MemoryImg(radius:45,bytes:widget.bytes),
            const SizedBox(height: 15,),
            TextWidget(text:widget.trancated, size:22, color:themeProvider.getHeadingTextColor, weight:FontWeight.w400, lineheight: 24),
            const SizedBox(height: 5,),
            const Divider(thickness: 1,),
            Row(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                      newRow(widgets: themeProvider.getThemeMode ?Image.asset("assets/icons/Vectordark.png"):Image.asset("assets/icons/Vector.png"),label:"Phone no"),
                      const SizedBox(height: 15,),
                      newRow(widgets:themeProvider.getThemeMode ? Image.asset("assets/icons/smsdark.png"):Image.asset("assets/icons/sms.png"), label:"Email Address"),
                      const SizedBox(height: 15,),
                      newRow(widgets:themeProvider.getThemeMode ? Image.asset("assets/icons/cakedark.png"): Image.asset("assets/icons/cake.png"), label:"Birthday")
                    ],
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                      newRowDetail(value:widget.phoneNo),
                      const SizedBox(height: 15,),
                      newRowDetail(value:""),
                      const SizedBox(height: 15,),
                      newRowDetail(value: "")
                  ],
                )
              ],
            ),
          ],
        )
      ),
    );        
  }

   Row newRowDetail({required dynamic value}) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Row(
      children: [
        TextWidget(text:":", size: 18, color:themeProvider.getTextColor2, weight: FontWeight.w500, lineheight:18),
        const SizedBox(width: 5,),
        TextWidget(text:"$value", size: 18, color: themeProvider.getHeadingTextColor, weight: FontWeight.w500, lineheight:18),
      ],
    );
  }
  Row newRow({required Widget widgets,required String label}) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Row(
      children: [
        widgets,
        const SizedBox(width: 22,),
        TextWidget(text:label, size: 16, color: themeProvider.getTextColor2, weight: FontWeight.w500, lineheight:18),
      ],
    );
  }
}
