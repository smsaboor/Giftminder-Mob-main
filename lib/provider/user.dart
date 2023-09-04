import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:giftminder/helper/sharedStorageManager.dart';
import 'package:giftminder/model/user.dart';
import 'package:giftminder/screen/tab/calenders.dart';
import 'package:intl/intl.dart';

class Users with ChangeNotifier{
   User _user =User(name:"", emailAddress:"");
   bool _isLogged = false;
   void createUser({required String username ,required String email,required String authToken}){
      _user.name=username;
      _user.emailAddress = email;
      SharedStorageManager.saveData("AuthToken",authToken);
      SharedStorageManager.saveData("LoggedUserName",username);
      SharedStorageManager.saveData("LoggedUserEmail",email);
      SharedStorageManager.saveData("isloggedIn",true);
      _isLogged=true;
      notifyListeners();
   }
   void setUserFromAsync()async{
      _isLogged = await SharedStorageManager.readData("isloggedIn");
      if(_isLogged){
        _user.name= await SharedStorageManager.readData("LoggedUserName");
        _user.emailAddress= await SharedStorageManager.readData("LoggedUserEmail");
        _isLogged = await SharedStorageManager.readData("isloggedIn");
      }
   }
   void setLogout(){
      _isLogged=false;
      SharedStorageManager.saveData("AuthToken","");
      SharedStorageManager.saveData("LoggedUserName","");
      SharedStorageManager.saveData("LoggedUserEmail","");
      SharedStorageManager.saveData("isloggedIn",false);
      _user.name="";
      _user.emailAddress ="";
   }
   bool get isLoggedUser{
     return _isLogged;
   }

   void changeUserName(String name){
     _user.name=name;
     notifyListeners();
   }
   void changeEmail(String email){
     _user.emailAddress=email;
     notifyListeners();
   }
   void changeDP(File file){
     _user.image=file;
     notifyListeners();
   }
   User get getUser{
      return _user;
   }

   YearMonth setDate(){
       int reminder =DateTime.now().month-1;
       String month = reminder==0?"January":reminder==1?"Febraury":reminder==2?"March":reminder==3?"April":reminder==4?"May":reminder==5 ? "June": reminder==6?"July" :reminder==7 ?"August" :reminder==8 ? "September" :reminder==9?"October" :reminder==10?"Novermber" : "December";
       return YearMonth(month:month, year: DateTime.now().year, monthNo:DateTime.now().month);
   }
   bool _isDateSetted = false;
    YearMonth? _yearMonth ;
    void setYearMonth({required YearMonth obj}){
       _yearMonth = YearMonth(month: obj.month, year:obj.year, monthNo: obj.monthNo);
    }

    YearMonth? get getYearMonth {
       return _yearMonth;
    }
    void initializeDate(){
       if(!_isDateSetted){
          _yearMonth  = setDate();
       }
    }
    

}