// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../providers/theme_provider.dart';
import 'package:provider/provider.dart';

class MyButton extends StatelessWidget{
    MyButton({
        super.key,
        this.icon,
        this.text,
        this.type,
        required this.callback,
        this.flex = 1
    });

    String? text;
    IconData? icon;
    int flex;
    String? type;
    Function callback;

    @override
    Widget build(BuildContext context) {        
        bool isDarkMode =  Provider.of<ThemeProvider>(context).isDarkMode;

        Color primaryColor = CupertinoTheme.of(context).primaryColor;
        Color textColor = isDarkMode ? Colors.white : Colors.black;

        Color getBrighterColor(Color originalColor) {
            return CupertinoDynamicColor.withBrightness(
                color: originalColor.withOpacity(0.7),
                darkColor: originalColor.withOpacity(0.7),
            );
        }

        Color getColor(){
            if(type == "operator") {
                return primaryColor;
            }
            else if(type == "special") {
                return getBrighterColor(primaryColor);
            }
            else if(isDarkMode) {
                return const Color.fromARGB(255, 15, 17, 18);
            }
            else {
                return Colors.white;
            }
        }

        Widget getButtonContent() {
            if(text != null) {
                return Text(
                    text!,
                    style: TextStyle(
                        color: ["special", "operator"].contains(type) ? Colors.white : textColor,
                        fontSize: 25
                    )
                );
            }
            else if(icon != null) {
                return Icon(
                    icon,
                    size: 25,
                    color: Colors.white
                );
            }
            else {
                return const Text("");
            }
        }

        double padding = Provider.of<ThemeProvider>(context, listen: false).padding;

        return(
            Expanded(
                flex: flex,
                child: Padding(
                    padding: EdgeInsets.all(padding/2),
                    child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => callback(),
                        color: getColor(),
                        child: Center(
                            child: getButtonContent(),
                        ), 
                    ),
                ),
            )
        );
    }
}