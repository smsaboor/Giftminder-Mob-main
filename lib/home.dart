import 'package:flutter/material.dart';
import 'package:giftminder/provider/themeProvider.dart';
import 'package:giftminder/screen/tab/calender.dart';
import 'package:giftminder/screen/tab/gifttab.dart';
import 'package:giftminder/screen/tab/homeContactTab.dart';
import 'package:giftminder/screen/tab/homefeed.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _selectedIndex,
    );
  }
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return  Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500), curve: Curves.ease);
            });
          },
           items: <BottomNavigationBarItem>[
              bottomNavigationItem(themeProvider: themeProvider,assetImgDark: "homedark",assetImgWhite: "homewhite",label: ""),
              bottomNavigationItem(themeProvider: themeProvider, label:"", assetImgDark:"user-tag", assetImgWhite:"user-tag"),
              bottomNavigationItem(themeProvider: themeProvider, label:"", assetImgDark:"calendar", assetImgWhite:"calendar"),
              bottomNavigationItem(themeProvider: themeProvider, label:"", assetImgDark:"gift", assetImgWhite:"gift"),
          ]
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children:const [
            HomeScreenTab(),
            HomeContactTab(),
            Calender(),
            Gifttab()
          ],
        ));
  }

  BottomNavigationBarItem bottomNavigationItem({required ThemeProvider themeProvider,required String label,required String assetImgDark,required String assetImgWhite}) {
    return BottomNavigationBarItem(backgroundColor: themeProvider.getBackgroundColorBottomNavigation,
      activeIcon:themeProvider.getThemeMode? ImageIcon(AssetImage("assets/icons/$assetImgDark.png"),size: 39,color: themeProvider.getPrimaryColor,) :ImageIcon(AssetImage("assets/icons/$assetImgWhite.png"),color:themeProvider.getPrimaryColor,size:29,) ,
      icon: themeProvider.getThemeMode? ImageIcon(AssetImage("assets/icons/$assetImgDark.png"),size: 32,):ImageIcon(AssetImage("assets/icons/$assetImgWhite.png"),size: 32,color: Colors.black38,),//color:Color.fromARGB(255, 24, 31, 44),),
      label: label
    );
  }
}
