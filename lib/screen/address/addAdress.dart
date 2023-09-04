import 'package:flutter/material.dart';
import 'package:giftminder/components/button.dart';
import 'package:giftminder/components/commonHeader.dart';
import 'package:giftminder/components/text.dart';
import 'package:giftminder/model/address.dart';
import 'package:giftminder/provider/addresses.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/screen/auth/components/textField.dart';
import 'package:giftminder/components/SizedBoxDialogDone.dart';
import 'package:giftminder/screen/components/eventCard.dart';
import 'package:giftminder/theme/color.dart';
import 'package:provider/provider.dart';

class AddAdress extends StatefulWidget {
  const AddAdress({ Key? key }) : super(key: key);

  @override
  _AddAdressState createState() => _AddAdressState();
}

class _AddAdressState extends State<AddAdress> {

  bool genuine = true;
  int? inde;
  String dynamicButtonName = "Add Address";
  String dynamicHeaderName = "Add Address";


  final TextEditingController _nameControler = TextEditingController();
  final TextEditingController _phoneNoControler = TextEditingController();
  final TextEditingController _zipCodeControler = TextEditingController();
  final TextEditingController _fullAddControler = TextEditingController();
  void addAddress()async{
    print(_zipCodeControler.text);
    if(_fullAddControler.text.isNotEmpty && _nameControler.text.isNotEmpty && _phoneNoControler.text.length>9 && _zipCodeControler.text.length>5){
       final _provider = Provider.of<Addresses>(context,listen: false);
       final themeProvider = Provider.of<ThemeProvider>(context,listen: false);
        if(genuine){
             _provider.addAddress(fullAddress:_fullAddControler.text, personName:_nameControler.text,phoneNo:_phoneNoControler.text, zip:_zipCodeControler.text);
        }else{await showDialog(
            context: context,
            builder: (context) => Dialog1(
              content: SizedBoxDialogDone(themeProvider: themeProvider,label: "Address Changed",widgets: themeProvider.getThemeMode ?Image.asset("assets/icons/tickcircledark.png",height: 75,width: 75,): Image.asset("assets/icons/tick-circle.png",height: 75,width: 75,),)));
              _provider.modifyAddressByIndex(index:inde as int ,fullAddress:_fullAddControler.text, personName:_nameControler.text,phoneNo:_phoneNoControler.text, zip:_zipCodeControler.text);
            }   
       Navigator.pop(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    width = width-60.90;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final addressProvider =Provider.of<Addresses>(context);
    try {
         if(genuine){
          final indexs = ModalRoute.of(context)!.settings.arguments as AddressArguments;
          final addressGeted = addressProvider.getByIndex(indexs.index);
          inde=indexs.index;
          genuine=indexs.value;
          _fullAddControler.text = addressGeted.fullAddress;
          _nameControler.text = addressGeted.personName;
          _phoneNoControler.text= "${addressGeted.phoneNo}";
          _zipCodeControler.text = "${addressGeted.zipCode}";
           dynamicButtonName=indexs.buttonName;
           if(!indexs.value){
           dynamicHeaderName="Edit Adresss";
         }
         }
         
    } catch (e) {}

    return Material(
      color: themeProvider.getBackgroundColor2,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children:[
          CenterHeadingBar(title:dynamicHeaderName),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 25),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: "Add Address", size:23, color:themeProvider.getHeadingTextColor , weight: FontWeight.w700, lineheight:24),
                const SizedBox(height: 25,),
                textAndTextFieldCombined(label:"Full name", hinttext: "Enter your full name. ", controller:_nameControler,types: TextInputType.name),
                textAndTextFieldCombined(label:"Phone number", hinttext: "Enter your phone number", controller:_phoneNoControler,types: TextInputType.phone),
                const TextWidgetCommon(text:"Full Address"),
                const SizedBox(height: 7.07,),
                TextField(
                  maxLines: 5,
                  style: TextStyle(color:themeProvider.getHeadingTextColor ),
                  controller:_fullAddControler,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: themeProvider.gettextFieldBackgroundColor,
                    hintText:"Enter your complete address",
                    hintStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: themeProvider.getlabelColor1),
                    enabledBorder: OutlineInputBorder(borderSide:const BorderSide(width: 1,color: Color.fromARGB(60, 18, 17, 17)), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                textAndTextFieldCombined(label:"Zip code", hinttext: "Enter your ZIP code", controller:_zipCodeControler,types: TextInputType.number),
                const SizedBox(height: 40,),
                ButtonCategory1(fontweight: FontWeight.w600, fontsize: 16, size: Size(width, 50),borderCirculer: 8,borderSideColor: ConstantColor.ButtonBorderColor,backgroundColor:themeProvider.getPrimaryColor,text:dynamicButtonName,
                  function:addAddress
                ),
            ]),
          )
      ]),
    );
  }
   Column textAndTextFieldCombined({required TextInputType types, required String label,required String hinttext,required TextEditingController controller})=> Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidgetCommon(text: label),
        const SizedBox(height: 7.07,),
        TextFields(controllers: controller, hinttext:hinttext,types: types,validate: true,erortext: "",),
        const SizedBox(height: 20,)]);
}
