import 'package:flutter/material.dart';
import 'package:giftminder/model/address.dart';

class Addresses with ChangeNotifier{
   List<Address> _address = [];

   List<Address> get getAddress{
     return _address;
   }

   void deleteAddressAtIndex(int index){
      _address.removeAt(index);
      notifyListeners();
   }
   Address getByIndex(int index){
      return _address.elementAt(index);
   }
   void modifyAddressByIndex({required int index, required String fullAddress, required String personName, required String phoneNo, required String zip}){
      int phone = int.parse(phoneNo);
      int zipCode = int.parse(zip);
       _address.removeAt(index);
      _address.add(Address(fullAddress: fullAddress, personName: personName, phoneNo: phone, zipCode: zipCode));
      notifyListeners();
      
   }

   void addAddress({required String fullAddress, required String personName, required String phoneNo, required String zip}){
      int phone = int.parse(phoneNo);
      int zipCode = int.parse(zip);
      _address.add(Address(fullAddress: fullAddress, personName: personName, phoneNo: phone, zipCode: zipCode));
      notifyListeners();
   }
}