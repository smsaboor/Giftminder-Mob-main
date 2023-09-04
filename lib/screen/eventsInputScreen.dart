import 'package:flutter/material.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/screen/auth/components/textField.dart';
import 'package:giftminder/screen/components/inputdialog.dart';
import 'package:giftminder/screen/localstate/local.dart';
import 'package:giftminder/theme/color.dart';
import 'package:giftminder/components/button.dart';
import 'package:giftminder/components/commonHeader.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/provider/eventProvider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventsInputScreen extends StatefulWidget {
  const EventsInputScreen({ Key? key }) : super(key: key);

  @override
  _EventsInputScreenState createState() => _EventsInputScreenState();
}

class _EventsInputScreenState extends State<EventsInputScreen> {

  final TextEditingController _eventController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _reminderController = TextEditingController();
  final TextEditingController _interest1Controller = TextEditingController();
  final TextEditingController _interest2Controller = TextEditingController();
  final TextEditingController _interest3Controller = TextEditingController();
  
  int sDateChk1 = 0;
  late DateTime selectedDate1;
  bool selectedCategory = false;
  String formatedDate="";
  int _Reminder =7 ;
  String eventtype = "";
  String interest1 = "";
  String interest2 = "";
  String interest3 = "";

  late String personName;

  @override
  void initState() {
    
    super.initState();
  }
  
  
  void setDateController(DateTime time){
    setState(() {
      formatedDate="${DateFormat.yMd().format(time)}";
      _dateController.text=" ${DateFormat.yMd().format(time)}";
    });
  }
  void _customShowDatePicker(){
      showDatePicker(
        context: context,
          initialDate: DateTime.now(), firstDate: DateTime(2022),
            lastDate: DateTime(2030)
        ).then((pickedDate){
            if(pickedDate==null){
              return;
            }
            setDateController(pickedDate);
            
            setState(() {
              
              sDateChk1 = 1;
              selectedDate1 = pickedDate;
            }); 
        }); 
    }


  void saveEvents(){
      if(_eventController.text.isEmpty ||sDateChk1==0 ){
        return;
      }
      eventtype = _eventController.text;
      interest1 = _interest1Controller.text;
      interest2 = _interest2Controller.text;
      interest3 = _interest3Controller.text;

      final handler = Provider.of<Events>(context,listen: false);
      handler.addnewEvents(formatedDate:formatedDate, person: personName, time: selectedDate1, 
                      eventId: "${DateTime.now()}", events: eventtype, interest:[interest1,interest2,interest3], 
                      reminderDay:_Reminder);
      Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {

    personName = ModalRoute.of(context)!.settings.arguments as String;
    final localStateProvider = Provider.of<LocalDialogStateManagement>(context);
    double width = MediaQuery. of(context). size. width;
    final themeProvider = Provider.of<ThemeProvider>(context);
    width = width-60.90;

    return Material(
      color: themeProvider.getBackgroundColor1,
       child: Column( 
          children:[
            const CenterHeadingBar(title:"Gift Interests"),
            Container(
              padding: const EdgeInsets.only(left: 30,right: 30,top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                    const TextWidgetCommon(text: "Select Events"),
                    const SizedBox(height: 7.07,),
                    TextFieldInterest(controllers: _eventController, func:() async {
                        await showDialog(context: context,builder: (context) => CustomDialogInputEvent(height:150,label: "Event",)).then((value){
                            final ValEvType =localStateProvider.getEvent;
                            if(ValEvType[0]){_eventController.text ="Birthday";}else if(ValEvType[1]){_eventController.text="Anniversary";}
                            setState(() {});
                        }); 
                      },),
                    const SizedBox(height: 20,),
                    const TextWidgetCommon(text: "Select date"),
                    const SizedBox(height: 7.07,),
                    TextField(controller: _dateController,
                      style: TextStyle(color:themeProvider.getHeadingTextColor ),
                      decoration:InputDecoration( filled: true,
                        fillColor: themeProvider.gettextFieldBackgroundColor,
                        suffixIcon:IconButton(icon:ImageIcon(const AssetImage("assets/icons/calendar1.png"),size: 42,color:themeProvider.getPrimaryColor,),
                        onPressed: _customShowDatePicker) ,
                        hintText: "Choose event date",
                        hintStyle:const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                        enabledBorder: OutlineBorder.outlineborder()
                      ) ,
                    ),
                    const SizedBox(height: 20,),
                    const TextWidgetCommon(text: "Select Reminder"),
                    const SizedBox(height: 7.07,),
                    TextField(controller: _reminderController,
                      style: TextStyle(color:themeProvider.getHeadingTextColor ),
                      decoration:InputDecoration( filled: true,
                        fillColor: themeProvider.gettextFieldBackgroundColor,
                        suffixIcon:IconButton(icon:ImageIcon(const AssetImage("assets/icons/VectorDown.png"),size: 42,color:themeProvider.getPrimaryColor,),
                          onPressed: () async {
                            await showDialog(context: context,builder: (context) => CustomDialogInputReminder(height:366,label: "Reminder",)).then((value){
                            final ValEvType =localStateProvider.getReminder;
                            _reminderController.text = "$ValEvType";
                            setState(() {});
                           }); 
                          }
                        ) ,
                        hintText: "7 days (default)",
                        hintStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                        enabledBorder: OutlineBorder.outlineborder()
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                    const SizedBox(height: 20,),
                    const TextWidgetCommon(text: "Select Interests"),
                    const SizedBox(height: 7.07,),
                    TextFieldInterest(controllers: _interest1Controller , 
                     func:() async {
                        await showDialog(
                          context: context,builder: (context) => CustomDialogInputInterest1(height:366,label: "Interest1",intNo: 0,)
                        ).then((value){
                          _interest1Controller.text= localStateProvider.getInterest1;
                            setState(() {});
                        });
                      },
                    ),
                    const SizedBox(height: 7.07,),
                    TextFieldInterest(controllers: _interest2Controller , 
                     func:() async {
                         await showDialog(
                          context: context,builder: (context) => CustomDialogInputInterest2(height:366,label: "Interest2",intNo: 1,)
                        ).then((value){
                          _interest2Controller.text= localStateProvider.getInterest2;
                            setState(() {});
                        });
                      },
                    ), 
                    const SizedBox(height: 7.07,),
                    TextFieldInterest(controllers: _interest3Controller , 
                     func:() async {
                        await showDialog(
                          context: context,builder: (context) => CustomDialogInputInterest3(height:366,label: "Interest3",intNo: 2,)
                        ).then((value){
                          _interest3Controller.text= localStateProvider.getInterest3;
                            setState(() {});
                        });
                      },
                    ),
                    const SizedBox(height: 50,),
                    ButtonCategory1(fontweight: FontWeight.w600, fontsize: 16, size: Size(width, 50),borderCirculer: 8,borderSideColor: ConstantColor.ButtonBorderColor,backgroundColor:themeProvider.getPrimaryColor,text:"Done",function:saveEvents),
              ],
            ),
          ),
        ],
      ),
    );
  }
}