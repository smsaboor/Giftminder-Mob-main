import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart'; 

class ContactServices {

  static Future<bool> askPermission()async{
    await Permission.contacts.request();
    return  await Permission.contacts.isGranted;
  }
  static Future<bool>  get checkPermission async{
    bool permission = await Permission.contacts.isGranted;
    return permission;
  }

  static Future<List<Contact>> get getContact async{
    List<Contact> contacts = await ContactsService.getContacts(); 
    return contacts;
  }


}