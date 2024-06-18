import 'package:flutter/material.dart';
import 'package:namer_app/theme/theme.dart';


final MaterialTheme materialTheme = MaterialTheme(TextTheme());

final ThemeData lightTheme = materialTheme.light();
final ThemeData darkTheme = materialTheme.dark();

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightTheme;
  ThemeData get themeData => _themeData;
  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }
  void toggleTheme() {
    if(_themeData == lightTheme){
      themeData = darkTheme;
    } else {
      themeData = lightTheme;
    }

  }
}