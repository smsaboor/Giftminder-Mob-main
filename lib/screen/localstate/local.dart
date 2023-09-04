// ignore_for_file: prefer_final_fields
import 'package:flutter/material.dart';
class LocalDialogStateManagement with ChangeNotifier {
    List<bool> _selectEvent = [false,false,false];
    int _reminderDay = 7;
    String _interest1 = "";
    String _interest2 = "";
    String _interest3 = "";
    void setEvent(int index,bool val){_selectEvent[index]=val;notifyListeners();}
    void setInterest1(String interest) => _interest1=interest;
    void setInterest2(String interest) => _interest2=interest;
    void setInterest3(String interest) => _interest3=interest;
    void setReminder(int days)=> _reminderDay = days;
    List<bool> get getEvent=>_selectEvent;
    int get getReminder=>_reminderDay;
    String get getInterest1=> _interest1;
    String get getInterest2=> _interest2;
    String get getInterest3=> _interest3;
    
}