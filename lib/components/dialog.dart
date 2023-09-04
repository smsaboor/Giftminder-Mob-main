import 'package:flutter/material.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:provider/provider.dart';

Future<void> showMyDialog({required double dialogHeight, required bool hidepositioned, required BuildContext context,required Widget widgetRow1,required Widget widgetRow2,required Widget widgetRow3 }) async {

  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {

       //final themeProvider = Provider.of<ThemeProvider>(context);
      return AlertDialog(
        content: Stack(
          children: [
            hidepositioned?const SizedBox(height: 1,):Positioned(
              top: 0.0,
              right: 0.0,
              child:InkWell(  
                onTap:(){
                  Navigator.of(context).pop(false);
                },
                child: Image.asset("assets/icons/cross.png"),
              )
            ),
            Container(
            //decoration: BoxDecoration(color:themeProvider.getDialogBoxBackgroundColor1 ),
              height: dialogHeight,
              width: 320,
              child: Column(children: [
                  widgetRow1,
                  const SizedBox(height: 14,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: widgetRow2),
                  const SizedBox(height: 10,),
                  const Divider(),
                  widgetRow3
        
            ],),
          ),]
        )
      );
    },
  );
}
Future<void> showMyDialogDelete(BuildContext context, String name,String eventType) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Stack(
          children: [
            Positioned(
              top: 0.0,
              right: 0.0,
              child:InkWell(  
                onTap:(){
                  Navigator.of(context).pop(false);
                },
                child: Image.asset("assets/icons/cross.png"),
              )
            ),
            SizedBox(
              height: 200,
              width: 320,
              child: Column(children: [
                  Image.asset("assets/icons/delete.png",height: 75,width: 75,),
                  const SizedBox(height: 14,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Text("Are you sure you want to delete $name $eventType info?",textAlign: TextAlign.center, style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
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
      
          ],
        ));
    },
  );
}
Future<void> ErrorDialog(BuildContext context,String eror) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          height: 160,
          width: 200,
          child: Column(children: [
              Icon(Icons.error_outline,size: 45,),
              const SizedBox(height: 14,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:8.0),
                child: Text(eror,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
              ),
              const SizedBox(height: 10,),
              const Divider(),
              TextButton(
              child: const Text('Back',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.red),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],),
        ),
      );
    },
  );
}