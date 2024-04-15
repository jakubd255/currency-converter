import 'package:currency_converter/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeProvider extends ChangeNotifier {
    var box = Hive.box("myBox");
    
    final double _padding = 8;
    double get padding => _padding;

    late String _choice;
    String get choice => _choice;

    late int _colorIndex;
    int get colorIndex => _colorIndex;

    ThemeColor get themeColor => themeColors[_colorIndex];
    Color get primaryColor => themeColors[_colorIndex].primary;

    ThemeProvider() {
        _choice = box.get("darkMode", defaultValue: "system");
        _colorIndex = box.get("colorIndex", defaultValue: 0);
    }

    void setBrightness(String choice) {
        _choice = choice;
        box.put("darkMode", choice);
        notifyListeners();
    }

    Brightness getBrightness(BuildContext context) {
        switch(_choice) {
            case "light": return Brightness.light;
            case "dark": return Brightness.dark;
            default: return MediaQuery.platformBrightnessOf(context);
        }
    }

    void setColor(int index) {
        _colorIndex = index;
        box.put("colorIndex", index);
        notifyListeners();
    }
}