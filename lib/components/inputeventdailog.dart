
import 'package:flutter/material.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/provider/eventProvider.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:provider/provider.dart';

class CustomDialogInputEvent extends StatefulWidget {
  @override
  _CustomDialogInputEventState createState() => _CustomDialogInputEventState();
}

class _CustomDialogInputEventState extends State<CustomDialogInputEvent> {
    bool _checkBoxBirthday = false;
    bool _checkBoxAnniversary = false;
    bool _checkBoxOther = false;

    @override
  void initState() {
    final eventProvider = Provider.of<Events>(context,listen: false);
    _checkBoxAnniversary = eventProvider.getCheckBoxAnniversary;
    _checkBoxBirthday=eventProvider.getCheckBoxBirthday;
    _checkBoxOther=eventProvider.getCheckBoxOther;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final eventProvider = Provider.of<Events>(context);
    return AlertDialog(
      backgroundColor: themeProvider.getcardBackgroundColor,
      content: SizedBox(
        height: 224,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget(text: "Filters", size:20, color: themeProvider.getHeadingTextColor, weight:FontWeight.w600, lineheight:21),
              Column(
                children: [
                  Divider(thickness: 1,color: themeProvider.getdividerColor,),
                  Container(
                    decoration: BoxDecoration(color:themeProvider.getcardBackgroundColor,),
                    padding: const EdgeInsets.only(left: 15,right: 20),
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(text: "Birthdays", size:18, color:themeProvider.getHeadingTextColor, weight:FontWeight.w500, lineheight:19),
                            Checkbox(
                              fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return themeProvider.getPrimaryColor.withOpacity(.32);
                                }
                                return themeProvider.getPrimaryColor;
                              }),
                              checkColor: themeProvider.getPrimaryColor,
                              value:_checkBoxBirthday, onChanged:((value){
                              _checkBoxBirthday=value as bool;
                              setState(() {});
                            }))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(text: "Anniversary", size:18, color:themeProvider.getHeadingTextColor, weight:FontWeight.w500, lineheight:19),
                            Checkbox(
                              fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return themeProvider.getPrimaryColor.withOpacity(.32);
                                }
                                return themeProvider.getPrimaryColor;
                              }),
                              checkColor: themeProvider.getPrimaryColor,
                              value:_checkBoxAnniversary, onChanged:((value){
                              _checkBoxAnniversary=value as bool;
                              setState(() {});
                            }))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(text: "Other", size:18, color:themeProvider.getHeadingTextColor, weight:FontWeight.w500, lineheight:19),
                            Checkbox(
                              fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return themeProvider.getPrimaryColor.withOpacity(.32);
                                }
                                return themeProvider.getPrimaryColor;
                              }),
                              checkColor: themeProvider.getPrimaryColor,
                              value:_checkBoxOther, onChanged:((value){
                              _checkBoxOther=value as bool;
                              setState(() {});
                            }))
                          ],
                        )
                      ]),
              )]),
              Divider(color: themeProvider.getdividerColor,thickness: 1,),
              InkWell(
                child:Text('Done',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:themeProvider.getPrimaryColor),),
                onTap: () {
                  eventProvider.setCheckBoxAnniversary(_checkBoxAnniversary);
                  eventProvider.setCheckBoxBirthday(_checkBoxBirthday);
                  eventProvider.setCheckBoxOther(_checkBoxOther);
                  Navigator.of(context).pop();
                },
              ),
            ],
        ),
      ),
    );
  }
}
