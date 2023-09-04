import 'package:flutter/material.dart';
import 'package:giftminder/model/transaction.dart';

class Transactions with ChangeNotifier{
    
    List<Transaction> _transactions = [];

    void addTransaction({required String eventForPurchase,required DateTime dataTime,required double price,required String productId,required String transactionId}){
       _transactions.add(Transaction(eventForPurchase: eventForPurchase, dataTime: dataTime, price: price, productId: productId, transactionId: transactionId));
       notifyListeners();
    }

    List<Transaction> get getTransactionList {
       return _transactions;
    }
}