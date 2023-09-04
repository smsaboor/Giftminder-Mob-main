import 'package:flutter/material.dart';
import 'package:giftminder/model/gift.dart';

class Gifts with ChangeNotifier{
   
   List<Gift> _gifts = [
     Gift(weight: 250, brand: "Addidas", discountedPrice:150, giftId:"ytytytytyytyty", giftName:"FootBall", giftImageUrl: ["assets/images/r11.png",""], material:"Rubber", percentOff:10, price:200, proof:"Water proof", suitableFor:""),
      Gift(weight: 250,brand: "Addidas", discountedPrice:150, giftId:"ytytytytyytyty", giftName:"Book", giftImageUrl: ["assets/images/r11.png",""], material:"Rubber", percentOff:10, price:200, proof:"Water proof", suitableFor:""),
      Gift(weight: 250,brand: "Addidas", discountedPrice:150, giftId:"ytytytytyytyty", giftName:"Pen", giftImageUrl: ["assets/images/r11.png",""], material:"Rubber", percentOff:10, price:200, proof:"Water proof", suitableFor:""),
      Gift(weight: 250,brand: "Addidas", discountedPrice:150, giftId:"ytytytytyytyty", giftName:"Shirt", giftImageUrl: ["assets/images/r11.png",""], material:"Rubber", percentOff:10, price:200, proof:"Water proof", suitableFor:""),
      
      Gift(weight: 250,brand: "Addidas", discountedPrice:150, giftId:"ytytytytyytyty", giftName:"FootBall", giftImageUrl: ["assets/images/r11.png",""], material:"Rubber", percentOff:10, price:200, proof:"Water proof", suitableFor:""),
      Gift(weight: 250,brand: "Addidas", discountedPrice:150, giftId:"ytytytytyytyty", giftName:"Book", giftImageUrl: ["assets/images/r11.png",""], material:"Rubber", percentOff:10, price:200, proof:"Water proof", suitableFor:""),
      Gift(weight: 250,brand: "Addidas", discountedPrice:150, giftId:"ytytytytyytyty", giftName:"Pen", giftImageUrl: ["assets/images/r11.png",""], material:"Rubber", percentOff:10, price:200, proof:"Water proof", suitableFor:""),
      Gift(weight: 250,brand: "Addidas", discountedPrice:150, giftId:"ytytytytyytyty", giftName:"Shirt", giftImageUrl: ["assets/images/r11.png",""], material:"Rubber", percentOff:10, price:200, proof:"Water proof", suitableFor:""),
      Gift(weight: 250,brand: "Addidas", discountedPrice:150, giftId:"ytytytytyytyty", giftName:"Shoes", giftImageUrl: ["assets/images/r11.png",""], material:"Rubber", percentOff:10, price:200, proof:"Water proof", suitableFor:"")
    
    ];

   List<Gift> get getGiftList{
     return _gifts;
   }
   List<Gift> get getSimiliarGift{
     return _gifts;
   }
    Gift getGiftById({required String id}){
      Gift gift = Gift(weight:0, brand:"", discountedPrice:0, giftId:"", giftName:"", giftImageUrl:[""], material:"", percentOff:0, price:0, proof:"", suitableFor:"");
      _gifts.forEach((element) {
        if(element.giftId==id){
         gift = element;
          return ;
        }
      });
      return gift;
   }

   
}