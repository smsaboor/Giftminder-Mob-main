class Address {
   String personName;
   int phoneNo;
   int zipCode;
   String fullAddress;
   Address({required this.fullAddress,required this.personName,required this.phoneNo,required this.zipCode});
   
}
class AddressArguments {
  final int index;
  bool value;
  String buttonName;

  AddressArguments(this.index, this.value, this.buttonName);
}