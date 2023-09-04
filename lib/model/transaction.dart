class Transaction {
    String transactionId;
    double price;
    String productId;
    DateTime dataTime;
    String eventForPurchase;
    Transaction({required this.eventForPurchase, required this.dataTime,required this.price,required this.productId,required this.transactionId});
}