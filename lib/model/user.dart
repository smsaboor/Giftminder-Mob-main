import 'dart:io';

class User {
   String name;
   String emailAddress;
   File? image;
   User({required this.name,required this.emailAddress,this.image});
}