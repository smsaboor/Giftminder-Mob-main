
import 'package:flutter/material.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/constant/const.dart';
import 'package:giftminder/provider/eventProvider.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/screen/localstate/local.dart';
import 'package:provider/provider.dart';

class CustomDialogInputEvent extends StatefulWidget {
  double height;
  String label;
  CustomDialogInputEvent({required this.height,required this.label});
  @override
  _CustomDialogInputEventState createState() => _CustomDialogInputEventState();
}

class _CustomDialogInputEventState extends State<CustomDialogInputEvent> {
    bool _checkBoxBirthday = false;
    bool _checkBoxAnniversary = false;
    bool _checkBoxOther = false;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final eventProvider = Provider.of<Events>(context);
    final localStateProvider = Provider.of<LocalDialogStateManagement>(context);
    return AlertDialog(
      backgroundColor: themeProvider.getcardBackgroundColor,
      content: SizedBox(
        //height:widget.height,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget(text:widget.label, size:20, color: themeProvider.getHeadingTextColor, weight:FontWeight.w600, lineheight:21),
              Column(
                children: [
                  Divider(thickness: 1,color: themeProvider.getdividerColor,),
                  Container(
                    height: widget.height,
                    padding: const EdgeInsets.only(left: 15,right: 20),
                    child: Column(children: [
                        CommonWidgetAndProperty.rowWidget1(themeProvider: themeProvider,label:"Birthdays", 
                          widget:Checkbox(
                              fillColor: CommonWidgetAndProperty.materialStateProperty(themeProvider: themeProvider),
                              checkColor: themeProvider.getPrimaryColor,
                              value:_checkBoxBirthday, onChanged:((value){
                              _checkBoxBirthday=value as bool;
                              _checkBoxAnniversary = false;
                              _checkBoxOther=false;
                              setState(() {});
                          }))),
                        CommonWidgetAndProperty.rowWidget1(themeProvider: themeProvider,label: "Anniversary",
                              widget: Checkbox(
                                fillColor: CommonWidgetAndProperty.materialStateProperty(themeProvider: themeProvider),
                                checkColor: themeProvider.getPrimaryColor,
                                value:_checkBoxAnniversary, onChanged:((value){
                                _checkBoxAnniversary=value as bool;
                                _checkBoxBirthday=false;
                                _checkBoxOther = false;
                                setState(() {});
                              }))),
                        CommonWidgetAndProperty.rowWidget1(themeProvider: themeProvider,label:"Other",
                              widget:Checkbox(
                                fillColor: CommonWidgetAndProperty.materialStateProperty(themeProvider: themeProvider),
                                checkColor: themeProvider.getPrimaryColor,
                                value:_checkBoxOther, onChanged:((value){
                                _checkBoxOther=value as bool;
                                _checkBoxAnniversary=false;
                                _checkBoxBirthday=false;
                                setState(() {});
                              })))
                      ])
              )]),
              Divider(color: themeProvider.getdividerColor,thickness: 1,),
              InkWell(
                child:Text('Done',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:themeProvider.getPrimaryColor),),
                onTap: () {
                  localStateProvider.setEvent(0,_checkBoxBirthday);
                  localStateProvider.setEvent(1,_checkBoxAnniversary);
                  localStateProvider.setEvent(2,_checkBoxOther);
                  Navigator.of(context).pop();
                },
              ),
            ],
        ),
      ),
    );
    
  } 
  
}


class CustomDialogInputReminder extends StatefulWidget {
  double height;
  String label;
  CustomDialogInputReminder({required this.height,required this.label});
  @override
  _CustomDialogInputReminderState createState() => _CustomDialogInputReminderState();
}

class _CustomDialogInputReminderState extends State<CustomDialogInputReminder> {
  
  int indexday = 7;
  List<bool> values = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final eventProvider = Provider.of<Events>(context);
    final localStateProvider = Provider.of<LocalDialogStateManagement>(context);
    return AlertDialog(
      backgroundColor: themeProvider.getcardBackgroundColor,
      content: SizedBox(
        height:widget.height,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget(text:widget.label, size:20, color: themeProvider.getHeadingTextColor, weight:FontWeight.w600, lineheight:21),
              Divider(color: themeProvider.getdividerColor,thickness: 1,),
              commonRow(themeProvider: themeProvider,index: 0),
              commonRow(themeProvider: themeProvider,index: 2),
              commonRow(themeProvider: themeProvider,index: 4),
              commonRow(themeProvider: themeProvider,index: 6),
              commonRow(themeProvider: themeProvider,index: 9),
              commonRow(themeProvider: themeProvider,index: 14),
              Divider(color: themeProvider.getdividerColor,thickness: 1,),
              InkWell(
                child:Text('Done',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:themeProvider.getPrimaryColor),),
                onTap: () {
                  localStateProvider.setReminder(indexday);
                  Navigator.of(context).pop();
                },
              ),
            ],
        ),
      ),
    );
    
  }

  Padding commonRow({required ThemeProvider themeProvider,required int index}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          TextWidget(text: "${index+1} days", size:16, color:themeProvider.getHeadingTextColor, weight:FontWeight.w500, lineheight:19),
          Checkbox(
            fillColor: CommonWidgetAndProperty.materialStateProperty(themeProvider: themeProvider),
            checkColor: themeProvider.getPrimaryColor,
            value:values[index], onChanged:((value){
            values[index]=value as bool;
            indexday = index+1;
            for (var i = 0; i < 15; i++) {
              if(i!=index){
                values[i]=false;
              }
            }
            setState(() {});
        }))
      ],),
    );
  } 
  
}


class CustomDialogInputInterest1 extends StatefulWidget {
  double height;
  String label;
  int intNo ;
  CustomDialogInputInterest1({required this.intNo, required this.height,required this.label});
  @override
  _CustomDialogInputInterest1State createState() => _CustomDialogInputInterest1State();
}

class _CustomDialogInputInterest1State extends State<CustomDialogInputInterest1> {
  
  String interest ='';
  List<bool> values = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final eventProvider = Provider.of<Events>(context);
    final localStateProvider = Provider.of<LocalDialogStateManagement>(context);
    return AlertDialog(
      backgroundColor:themeProvider.getcardBackgroundColor,
       content: SizedBox(
         height: 278,
         child: Column(
          children: [
            TextWidget(text:widget.label, size:20, color: themeProvider.getHeadingTextColor, weight:FontWeight.w600, lineheight:21),
              Divider(color: themeProvider.getdividerColor,thickness: 1,),
            SizedBox(
             height: 200,
              width: 200,
              child: ListView.builder(
                itemCount: ConstantValue.interestValues.length,
                itemBuilder: (context, index) {
                  return commonRow(themeProvider: themeProvider, index: index, label:ConstantValue.interestValues[index]);
                },
              ),
              
         ),
         Divider(color: themeProvider.getdividerColor,thickness: 1,),
              InkWell(
                child:Text('Done',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:themeProvider.getPrimaryColor),),
                onTap: () {
                    localStateProvider.setInterest1(interest);
                  Navigator.of(context).pop();
                },
              ),
          ],
         ),
       )
    );
    
  }

  Padding commonRow({required ThemeProvider themeProvider,required int index,required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          TextWidget(text:label, size:16, color:themeProvider.getHeadingTextColor, weight:FontWeight.w500, lineheight:19),
          Checkbox(
            fillColor: CommonWidgetAndProperty.materialStateProperty(themeProvider: themeProvider),
            checkColor: themeProvider.getPrimaryColor,
            value:values[index], onChanged:((value){
            values[index]=value as bool;
            interest = ConstantValue.interestValues[index];
            for (var i = 0; i < 15; i++) {
              if(i!=index){
                values[i]=false;
              }
            }
            setState(() {});
        }))
      ],),
    );
  } 
  
}
class CustomDialogInputInterest2 extends StatefulWidget {
  double height;
  String label;
  int intNo ;
  CustomDialogInputInterest2({required this.intNo, required this.height,required this.label});
  @override
  _CustomDialogInputInterest2State createState() => _CustomDialogInputInterest2State();
}

class _CustomDialogInputInterest2State extends State<CustomDialogInputInterest2> {
  
  String interest ='';
  List<bool> values = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final eventProvider = Provider.of<Events>(context);
    final localStateProvider = Provider.of<LocalDialogStateManagement>(context);
    return AlertDialog(
      backgroundColor: themeProvider.getcardBackgroundColor,
       content: SizedBox(
         height: 278,
         child: Column(
          children: [
            TextWidget(text:widget.label, size:20, color: themeProvider.getHeadingTextColor, weight:FontWeight.w600, lineheight:21),
              Divider(color: themeProvider.getdividerColor,thickness: 1,),
            SizedBox(
             height: 200,
              width: 200,
              child: ListView.builder(
                itemCount: ConstantValue.interestValues.length,
                itemBuilder: (context, index) {
                  return commonRow(themeProvider: themeProvider, index: index, label:ConstantValue.interestValues[index]);
                },
              ),
              
         ),
         Divider(color: themeProvider.getdividerColor,thickness: 1,),
              InkWell(
                child:Text('Done',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:themeProvider.getPrimaryColor),),
                onTap: () {
                    localStateProvider.setInterest2(interest);
                  Navigator.of(context).pop();
                },
              ),
          ],
         ),
       )
    );
    
  }

  Padding commonRow({required ThemeProvider themeProvider,required int index,required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          TextWidget(text:label, size:16, color:themeProvider.getHeadingTextColor, weight:FontWeight.w500, lineheight:19),
          Checkbox(
            fillColor: CommonWidgetAndProperty.materialStateProperty(themeProvider: themeProvider),
            checkColor: themeProvider.getPrimaryColor,
            value:values[index], onChanged:((value){
            values[index]=value as bool;
            interest = ConstantValue.interestValues[index];
            for (var i = 0; i < 15; i++) {
              if(i!=index){
                values[i]=false;
              }
            }
            setState(() {});
        }))
      ],),
    );
  } 
  
}


class CustomDialogInputInterest3 extends StatefulWidget {
  double height;
  String label;
  int intNo ;
  CustomDialogInputInterest3({required this.intNo, required this.height,required this.label});
  @override
  _CustomDialogInputInterest3State createState() => _CustomDialogInputInterest3State();
}

class _CustomDialogInputInterest3State extends State<CustomDialogInputInterest3> {
  
  String interest ='';
  List<bool> values = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final eventProvider = Provider.of<Events>(context);
    final localStateProvider = Provider.of<LocalDialogStateManagement>(context);
    return AlertDialog(
      backgroundColor: themeProvider.getcardBackgroundColor,
       content: SizedBox(
         height: 278,
         child: Column(
          children: [
            TextWidget(text:widget.label, size:20, color: themeProvider.getHeadingTextColor, weight:FontWeight.w600, lineheight:21),
              Divider(color: themeProvider.getdividerColor,thickness: 1,),
            SizedBox(
             height: 200,
              width: 200,
              child: ListView.builder(
                itemCount: ConstantValue.interestValues.length,
                itemBuilder: (context, index) {
                  return commonRow(themeProvider: themeProvider, index: index, label:ConstantValue.interestValues[index]);
                },
              ),
              
         ),
         Divider(color: themeProvider.getdividerColor,thickness: 1,),
              InkWell(
                child:Text('Done',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:themeProvider.getPrimaryColor),),
                onTap: () {
                    localStateProvider.setInterest3(interest);
                  Navigator.of(context).pop();
                },
              ),
          ],
         ),
       )
    );
    
  }

  Padding commonRow({required ThemeProvider themeProvider,required int index,required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          TextWidget(text:label, size:16, color:themeProvider.getHeadingTextColor, weight:FontWeight.w500, lineheight:19),
          Checkbox(
            fillColor: CommonWidgetAndProperty.materialStateProperty(themeProvider: themeProvider),
            checkColor: themeProvider.getPrimaryColor,
            value:values[index], onChanged:((value){
            values[index]=value as bool;
            interest = ConstantValue.interestValues[index];
            for (var i = 0; i < 15; i++) {
              if(i!=index){
                values[i]=false;
              }
            }
            setState(() {});
        }))
      ],),
    );
  } 
  
}



class CommonWidgetAndProperty {
   static MaterialStateProperty<Color> materialStateProperty({required ThemeProvider themeProvider})=>
    MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return themeProvider.getPrimaryColor.withOpacity(.32);
        }return themeProvider.getPrimaryColor;
    });
    static Row rowWidget1({required ThemeProvider themeProvider,required Widget widget,required String label}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(text: label, size:18, color:themeProvider.getHeadingTextColor, weight:FontWeight.w500, lineheight:19),
        widget
      ],
    );
  }
}

