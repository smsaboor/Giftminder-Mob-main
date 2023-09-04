import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  
   bool _isDark =false;
   final List<Color> _headingTextColor = [const Color.fromRGBO(0, 0, 0, 1),const Color.fromRGBO(255, 255, 255, 1)];
   final List<Color> _headingTextColor2 = [const Color.fromRGBO(92, 92,92, 1),const Color.fromRGBO(255, 255, 255, 1)];
   final List<Color> _textColor1 = [const Color.fromRGBO(0, 0, 0, 0.7),const Color.fromRGBO(255, 255, 255, 0.7)]; 
   final List<Color> _dialogBoxBackgroundColor1 = [const Color.fromRGBO(47, 50, 55, 1),const Color.fromRGBO(255, 255, 255, 0.8)]; 
   final List<Color> _primaryColor = [const Color.fromRGBO(217, 89, 136, 1),const Color.fromRGBO(71, 121, 251, 1)]; 
   final List<Color> _buttonBackgroundColor = [const Color.fromRGBO(47, 50, 55, 1),const Color.fromRGBO(255, 255, 255, 1)]; 
   final List<Color> _backgroundColor1 = [const Color.fromRGBO(175, 175, 175, 0.1),const Color.fromRGBO(28, 29, 33, 1)];  
   final List<Color> _backgroundColor2 = [const Color.fromRGBO(255, 255, 255, 1),const Color.fromRGBO(28, 29, 33, 0.2)]; 
   final List<Color> _cardBackgroundColor = [const Color.fromRGBO(255, 255, 255, 1),const Color.fromRGBO(47, 50, 55, 1)]; 
   final List<Color> _searchFieldBackgroundColor = [const Color.fromRGBO(236, 236, 236, 1),const Color.fromRGBO(233, 233, 233, 0.1)]; 
   final List<Color> _textFieldBackgroundColor = [const Color.fromRGBO(247, 247, 247, 1),const Color.fromRGBO(47,50,55,0.2)]; 
   final List<Color> _labelColor1 = [const Color.fromRGBO(0,0,0,0.2),const Color.fromRGBO(255,255,255,0.2)]; 
   final List<Color> _textColor2 = [const Color.fromRGBO(0,0,0,0.75),const Color.fromRGBO(255,255,255,0.75)];
   final List<Color> _textColor3 = [const Color.fromRGBO(124, 124, 124, 1),const Color.fromRGBO(181, 181, 181, 1)];
   final List<Color> _textColor4 = [const Color.fromRGBO(32, 183, 92, 1),const Color.fromRGBO(32, 183, 92, 1)];
   final List<Color> _accentColor = [const Color.fromRGBO(51, 51, 51, 0.5),const Color.fromRGBO(255,255,255,0.5)];
   final List<Color> _dividerColor = [const Color.fromRGBO(175, 175, 175, 1),const Color.fromRGBO(86, 86, 86, 1)];
   final List<Color> _backgroundColorBottomNavigation = [const Color.fromRGBO(255, 255, 255, 1),const Color.fromRGBO(29, 34, 41, 1)];
   final List<Color> _errorTextColor = [const Color.fromARGB(255, 248, 83, 83),const Color.fromARGB(255, 248, 83, 83)];
   final List<LinearGradient> _appBarLinearGradient= [const LinearGradient(colors: [Color.fromRGBO(255, 255, 255, 1),Color.fromRGBO(255, 255, 255, 1),Color.fromRGBO(255, 255, 255, 1)],),const LinearGradient(colors:[Color.fromRGBO(15, 15, 15, 1),Color.fromRGBO(29, 34, 41, 1),Color.fromRGBO(33, 33, 33, 1)])];
   final List<LinearGradient> _bottomNaviBarLinearGradient= [const LinearGradient(colors: [Color.fromRGBO(255, 255, 255, 1),Color.fromRGBO(255, 255, 255, 1),Color.fromRGBO(255, 255, 255, 1)],),const LinearGradient(colors:[Color.fromRGBO(15, 15, 15, 1),Color.fromRGBO(29, 34, 41, 1),Color.fromRGBO(41, 41, 41, 1)])];
   LinearGradient get getLinearGradientAppBar=> _isDark ? _appBarLinearGradient[1] :_appBarLinearGradient[0];
   LinearGradient get getbottomNaviBarLinearGradient => _isDark ?_bottomNaviBarLinearGradient[1] :_bottomNaviBarLinearGradient[0];
   Color get getaccentColor => _isDark ?_accentColor[1] :_accentColor[0];
   Color get getErrorTextColor => _isDark ? _errorTextColor[1]:_errorTextColor[0];
   Color get getBackgroundColorBottomNavigation => _isDark ?_backgroundColorBottomNavigation[1] :_backgroundColorBottomNavigation[0];
   Color get getsearchFieldBackgroundColor => _isDark ?_searchFieldBackgroundColor[1] :_searchFieldBackgroundColor[0];
   Color get getdividerColor => _isDark ?_dividerColor[1] :_dividerColor[0];
   Color get gettextFieldBackgroundColor => _isDark ?_textFieldBackgroundColor[1] :_textFieldBackgroundColor[0];
   Color get getcardBackgroundColor => _isDark ?_cardBackgroundColor[1] :_cardBackgroundColor[0];
   Color get getlabelColor1 => _isDark ?_labelColor1[1] :_labelColor1[0];
   Color get getBackgroundColor2 => _isDark ?_backgroundColor2[1] :_backgroundColor2[0];
   Color get getBackgroundColor1 => _isDark ?_backgroundColor1[1] :_backgroundColor1[0];
   Color get getButtonBackgroundColor  => _isDark ?_buttonBackgroundColor[1] :_buttonBackgroundColor[0];
   Color get getPrimaryColor  => _isDark ?_primaryColor[1] :_primaryColor[0];
   Color get getHeadingTextColor => _isDark ? _headingTextColor[1]:_headingTextColor[0];
   Color get getHeadingTextColor2 => _isDark? _headingTextColor2[1] : _headingTextColor2[0];
   Color get getTextColor1 =>_isDark ?_textColor1[1] : _textColor1[0];
   Color get getTextColor2 =>_isDark ? _textColor2[1] :_textColor2[0];
   Color get getTextColor3 =>_isDark ? _textColor3[1] :_textColor3[0];
   Color get getTextColor4 =>_isDark ? _textColor4[1] :_textColor4[0];
   Color get getButtonTextColor => const Color.fromRGBO(255, 255, 255, 1);
   Color get getDialogBoxBackgroundColor1 => _isDark ?_dialogBoxBackgroundColor1[1]: _dialogBoxBackgroundColor1[0];
   bool get  getThemeMode =>_isDark;
   void setDark(){
     _isDark = true;
     notifyListeners();
   }
   void setLight(){
     _isDark = false;
     notifyListeners();
   }
}