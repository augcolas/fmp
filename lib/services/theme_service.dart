import 'package:flutter/material.dart';
import 'package:fmp/ui/common/themes.dart';

class ThemeModel extends ChangeNotifier {
  ThemeData _currentTheme = light;

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme = _currentTheme == light ? dark : light;
    notifyListeners();
  }
}
