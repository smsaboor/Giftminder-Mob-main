// import 'dart:io';
// import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:giftminder/model/contact.dart';
import 'package:giftminder/services/contactService.dart';
import 'package:crypto/crypto.dart';
// import 'package:path_provider/path_provider.dart' as appp;
// import 'package:permission_handler/permission_handler.dart';

class Contacts with ChangeNotifier{

   List<ContactUser> _contactDB = [];
   List<ContactUser> _contactRecent = [];
   bool _isLoaded = false;

   void loadContacts()async{
      if(_isLoaded){
          return;
      }
      final contact = await ContactServices.getContact;

      String generateMd5(String input) {
        return md5.convert(utf8.encode(input)).toString();
      }
      contact.forEach((element) {
         _contactRecent.add(ContactUser(avatar:element.avatar, company:element.company, displayName:element.displayName, 
              emails:element.emails, familyName:element.familyName, givenName:element.givenName, 
              jobTitle:element.jobTitle, middleName:element.middleName, phones:element.phones, 
              postalAddresses:element.postalAddresses, prefix:element.prefix, suffix:element.suffix,
                hashId:generateMd5("${element.displayName}${element.phones![0].value}")
              )
            );
      });
      _isLoaded= true;
   }

  Future<List<ContactUser>> getContact()async {
      return _contactRecent;
   }
}

