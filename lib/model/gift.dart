class Gift{
   String giftId;
   List<String> giftImageUrl;
   String giftName;
   double price;
   double discountedPrice;
   double percentOff;
   String brand;
   String material;
   String proof;
   String suitableFor;
   double weight;
   Gift({required this.weight, required this.brand,required this.discountedPrice,
          required this.giftId ,required this.giftName,
          required this.giftImageUrl,required this.material,
          required this.percentOff,required this.price,
          required this.proof,required this.suitableFor
        });
}