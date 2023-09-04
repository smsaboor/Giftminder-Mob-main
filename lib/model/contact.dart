import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/foundation.dart';

class ContactUser{
  String? networkImage;
  String hashId;
  // Name
  String? displayName;
  String? givenName;
  String? middleName;
  String? prefix;
  String? suffix;
  String? familyName;
  //Company
  String? company;
  String? jobTitle;
  List<Item>? emails = [];
  // Phone numbers
  List<Item>? phones = [];
  // Post addresses
  List<PostalAddress>? postalAddresses = [];
  // Contact avatar/thumbnail
  Uint8List? avatar;
  String avatarFileAddress = "";
  ContactUser({this.networkImage, required this.hashId, this.avatar,this.company,this.displayName,this.emails,this.familyName,required this.givenName,required this.jobTitle,required this.middleName,required this.phones,required this.postalAddresses,required this.prefix,required this.suffix});

}