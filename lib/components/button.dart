// ignore_for_file: must_be_immutable

import 'package:currency_converter/theme/theme.dart';
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
        ThemeColor themeColor = Provider.of<ThemeProvider>(context).themeColor;
        Color? systemTextColor = CupertinoTheme.of(context).textTheme.textStyle.color;

        Color getColor(){
            if(type == "operator") {
                return themeColor.primary;
            }
            else if(type == "special") {
                return themeColor.secondary;
            }
            else {
                return secondaryColor;
            }
        }

        Widget getButtonContent() {
            if(text != null) {
                return Text(
                    text!,
                    style: TextStyle(
                        color: ["special", "operator"].contains(type) ? Colors.white : systemTextColor,
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

        double padding = Provider.of<ThemeProvider>(context).padding;

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