import 'package:flutter/material.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/screen/components/card.dart';
import 'package:giftminder/screen/components/headerHome.dart';
import 'package:giftminder/components/memoryimg.dart';
import 'package:giftminder/components/searchField.dart';
import 'package:giftminder/components/dialog.dart';
import 'package:giftminder/components/filterdialog.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/provider/eventProvider.dart';
import 'package:provider/provider.dart';

class HomeScreenTab extends StatefulWidget {
  const HomeScreenTab({ Key? key }) : super(key: key);
  @override
  _HomeScreenTabState createState() => _HomeScreenTabState();
}

class _HomeScreenTabState extends State<HomeScreenTab> {
  
  final TextEditingController _searchController = TextEditingController();
  void _showDismissDialog({required String eventId, required String name,required String eventtype}){
    showMyDialog(dialogHeight: 195,context: context,hidepositioned: false,
      widgetRow1: Image.asset("assets/icons/slash.png",height: 75,width: 75,),
      widgetRow2: Text("Are you sure you want to dismiss $name $eventtype notification?",style:const TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
      widgetRow3: InkWell(
          child:Text('Dismiss',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Theme.of(context).primaryColorLight),),
          onTap: () {
            Provider.of<Events>(context,listen: false).addDissmissEvent(eventId);
            Navigator.of(context).pop();
          },
      ),
    );                                      
  }  
 // bool birthday = false;
  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<Events>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isAnyEvent = eventProvider.isAnyEvents;
    final isDarkMode = themeProvider.getThemeMode;
    return Material(
      color:themeProvider.getBackgroundColor1,
      child: SingleChildScrollView(child: 
      Column(children: [
        const homeBar(),
        const SizedBox(height: 15,),
        const SearchField(),
        Padding(padding: const EdgeInsets.only(left: 20,right: 20,),
          child: Column(children:[
            const SizedBox(height: 20,),
            isAnyEvent ? columnAtEvent(themeProvider, isDarkMode, context, eventProvider)
            :const CardHomeNewUser(),
             ]),
           )
        ])
      )
    );
  }

  Column columnAtEvent(ThemeProvider themeProvider, bool isDarkMode, BuildContext context, Events eventProvider) {
    return Column(children:[
        Padding(padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(text: "Upcoming Events", size:22, color:themeProvider.getHeadingTextColor, weight: FontWeight.w600, lineheight:24),
              isDarkMode ? InkWell(
                  onTap: ()=>showDialog<String>(context: context,builder: (context)=>CustomDialog()),
                  child: Image.asset("assets/icons/sortdark.png"),
                )
                :InkWell(
                  onTap: ()=>showDialog<String>(context: context,builder: (context)=>CustomDialog()),
                  child: Image.asset("assets/icons/sort.png"),
              )
            ]),
        ),
        SizedBox(height: 515,
          child: Padding(padding: const EdgeInsets.only(top:22 ),
            child: ListView.builder(itemCount: eventProvider.getAllEvents.length,
              itemBuilder:(context, index) {
                return Card(color: themeProvider.getcardBackgroundColor,
                  child:Container(padding: const EdgeInsets.only(left: 20,right: 30,top: 15,bottom: 14),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                            Row(children: [
                              MemoryImg(radius:22),
                              const SizedBox(width: 12,),
                              eventProvider.getAllEvents[index].person.length<17?
                                TextWidget(text: eventProvider.getAllEvents[index].person, 
                                          size: 18, color: themeProvider.getHeadingTextColor, weight: FontWeight.w600, lineheight:20)
                                :TextWidget(text: eventProvider.getAllEvents[index].person.replaceRange(
                                      17,eventProvider.getAllEvents[index].person.length,""), 
                                      size: 18, color: themeProvider.getHeadingTextColor, weight: FontWeight.w600, lineheight:20)
                            ]),
                            IconButton(onPressed:(){}, icon: Icon(Icons.arrow_forward_ios_sharp,color: themeProvider.getHeadingTextColor,)),            
                        ]),
                        const SizedBox(height: 12,),
                        TextWidget(text: "${eventProvider.getAllEvents[index].events} coming up on ${eventProvider.getAllEvents[index].formatedDate} ${eventProvider.getAllEvents[index].reminderDay} days to go !.", size:17, color:themeProvider.getTextColor1, weight:FontWeight.w500 , lineheight:16),
                        const SizedBox(height: 15,),
                        const Divider(thickness: 1,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [InkWell(
                            onTap:()=> _showDismissDialog(eventId: eventProvider.getAllEvents[index].eventId, name:eventProvider.getAllEvents[index].person,eventtype:eventProvider.getAllEvents[index].events),
                            child: TextWidget(text: "Dismiss", size:17, color: themeProvider.getHeadingTextColor, weight:FontWeight.w500, lineheight:18)
                        ),
                        const VerticalDivider(color: Colors.black,),
                        InkWell(onTap: () {},
                            child: TextWidget(text: "Buy Gifts", size:17, color:themeProvider.getPrimaryColor, weight:FontWeight.w500, lineheight:18),
                        )
                    ])
                  ]),
                ),
              );
            },
          ),
        ),
      )
    ]);
  }
}