import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



Color primaryColor = const CupertinoDynamicColor.withBrightness(
    color: Color.fromARGB(255, 240, 240, 240),
    darkColor: Color.fromARGB(255, 35, 35, 35),
);

Color secondaryColor = const CupertinoDynamicColor.withBrightness(
    color: Colors.white, 
    darkColor: Color.fromARGB(255, 15, 17, 18)
);

Color textColor = const CupertinoDynamicColor.withBrightness(
    color: Color.fromARGB(255, 0, 0, 0),
    darkColor: Color.fromARGB(255, 255, 255, 255),
);



class ThemeColor {
    ThemeColor(
        this.name,
        this.primary,
        this.secondary,
    );

    final String name;
    final Color primary;
    final Color secondary;
}



List<ThemeColor> themeColors = [
    ThemeColor(
        "Blue", 
        CupertinoColors.activeBlue, 
        CupertinoColors.activeBlue.withOpacity(0.7), 
    ),
    ThemeColor(
        "Green", 
        CupertinoColors.activeGreen, 
        CupertinoColors.activeGreen.withOpacity(0.7), 
    ),
    ThemeColor(
        "Orange", 
        CupertinoColors.activeOrange, 
        CupertinoColors.activeOrange.withOpacity(0.7), 
    ),
    ThemeColor(
        "Red", 
        CupertinoColors.systemRed, 
        CupertinoColors.systemRed.withOpacity(0.7), 
    ),
];