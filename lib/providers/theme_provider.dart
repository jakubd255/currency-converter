import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
    String _choice = "auto";
    String get choice => _choice;

    bool _isDarkMode = false;
    bool get isDarkMode => _isDarkMode;

    int _primaryColorIndex = 0;
    int get colorIndex => _primaryColorIndex;

    final List<Color> colors = <Color>[
        CupertinoColors.activeBlue,
        CupertinoColors.activeGreen,
        CupertinoColors.activeOrange,
        CupertinoColors.systemRed
    ];
    final List<String> colorNames = <String>[
        "Blue",
        "Green",
        "Orange",
        "Red"
    ];

    Color get primaryColor => colors[_primaryColorIndex];

    ThemeProvider(BuildContext context);

    void initialize(BuildContext context) {
        _isDarkMode = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    }

    void toggleTheme() {
        _isDarkMode = !_isDarkMode;
        notifyListeners();
    }

    void setTheme(String choice, context) {
        _choice = choice;
        if(choice == "auto") {
            _isDarkMode = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
        }
        else if(choice == "light") {
            _isDarkMode = false;
        }
        else if(choice == "dark") {
            _isDarkMode = true;
        }
        notifyListeners();
    }

    void setColor(int index) {
        _primaryColorIndex = index;
        notifyListeners();
    }

    Color get backgroundColor => _isDarkMode ? const Color.fromARGB(255, 15, 17, 18) : const Color.fromARGB(255, 255, 255, 255);
    Color get textColor => _isDarkMode ? Colors.white : Colors.black;
}