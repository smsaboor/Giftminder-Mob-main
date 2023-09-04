import 'package:flutter/material.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:provider/provider.dart';

class SearchField extends StatefulWidget {
  const SearchField({ Key? key }) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 30),
    child:SizedBox(
      height: 55,
      child:TextField(
          style: TextStyle(color:themeProvider.getHeadingTextColor ),
          decoration: InputDecoration(
          filled: true,
          fillColor:themeProvider.getsearchFieldBackgroundColor,
          hintStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: themeProvider.getlabelColor1),
          prefixIcon:Icon(Icons.search,color: themeProvider.getlabelColor1,),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
          hintText: 'Search contacts',
        ),
      ),
    ),
    );
  }
}