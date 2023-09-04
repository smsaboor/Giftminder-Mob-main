import 'package:flutter/material.dart';
import 'package:giftminder/model/event.dart';

class Events with ChangeNotifier{
    List<Event> _event = [];
    List<String> _dismissedEvent = [];
    bool isAnyEvent = false;
    bool _checkBoxBirthday = false;
    bool _checkBoxAnniversary = false;
    bool _checkBoxOther = false;
    bool get getCheckBoxBirthday {return _checkBoxBirthday;}
    bool get getCheckBoxAnniversary {return _checkBoxAnniversary;}
    bool get getCheckBoxOther {return _checkBoxOther;}
    void setCheckBoxBirthday(bool val){
       _checkBoxBirthday = val;
       notifyListeners();
    }
    void setCheckBoxAnniversary(bool val){
       _checkBoxAnniversary = val;
       notifyListeners();
    }
    void setCheckBoxOther(bool val){
       _checkBoxOther = val;
       notifyListeners();
    }
    bool get isAnyEvents {
       return isAnyEvent;
    }
    List<Event> eventByPerson(String person){
      List<Event> event = [];
      _event.forEach((element) {
          if(element.person==person){
             event.add(element);
          }
       });
       return event;
    }
    void addDissmissEvent(String eventId){
       _dismissedEvent.add(eventId);
       notifyListeners();
    }
    List<Event> get getAllEvents{
      List<Event> event=[];
      _event.forEach((elementEvent) {
          bool buck = true;
          _dismissedEvent.forEach((element) {
              if(elementEvent.eventId==element){
                  buck=false;  
              }
          });
          if(buck){
            if(!_checkBoxAnniversary && !_checkBoxBirthday && !_checkBoxOther){
                event.add(elementEvent);
            }else{
              if(_checkBoxAnniversary && !_checkBoxBirthday && !_checkBoxOther){
                if(elementEvent.events=="Anniversary"){
                  event.add(elementEvent);
                }
              }
              if(!_checkBoxAnniversary && _checkBoxBirthday && !_checkBoxOther){
                  if(elementEvent.events=="Birthday"){
                    event.add(elementEvent);
                  }
              }
              if(!_checkBoxAnniversary && !_checkBoxBirthday && _checkBoxOther){
                  if(!(elementEvent.events=="Birthday") && !(elementEvent.events=="Anniversary")){
                    event.add(elementEvent);
                  }
              }
              if(_checkBoxAnniversary && _checkBoxBirthday && !_checkBoxOther){
                  if(elementEvent.events=="Birthday" || elementEvent.events=="Anniversary" ){
                    event.add(elementEvent);
                  }
              }
              if(!_checkBoxAnniversary && _checkBoxBirthday && _checkBoxOther){
                  if((elementEvent.events=="Birthday") || !(elementEvent.events=="Anniversary") ){
                    event.add(elementEvent);
                  }
              }
              if(_checkBoxAnniversary && !_checkBoxBirthday && _checkBoxOther){
                  if(!(elementEvent.events=="Birthday") || (elementEvent.events=="Anniversary") ){
                    event.add(elementEvent);
                  }
              }
            }            
          }
        });
       return event;
    }
    bool isAnyEventRegisteredOnThatPerson(String person) {
       bool isAny = false;
       _event.forEach((element) {
          if(element.person==person){
             isAny=true;
          }
       });
       return isAny;
    }
    void deleteEvent(String eventId){
       _event.removeWhere((element) => element.eventId==eventId);
       if(_event.isEmpty){
         isAnyEvent=false;
       }
       notifyListeners();
    }
    ///// ADDING EVENTS WHEN USER WANTED TO CREATE NEW EVENTS RELATED TO FUTURE////////////////////////////////////////////
    void addnewEvents({required String formatedDate, required String person, required DateTime time,required String eventId,
              required String events,required List<String> interest,required int reminderDay})
    {
      final eventsadd = Event(formatedDate:formatedDate, person:person, eventDate: time, eventId: eventId, events: events, interest: interest, reminderDay: reminderDay);
      _event.add(eventsadd);
      isAnyEvent=true;
      notifyListeners();
    }
}