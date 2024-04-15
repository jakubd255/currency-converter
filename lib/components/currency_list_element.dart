// ignore_for_file: must_be_immutable

import 'package:currency_converter/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import '../providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'flag.dart';

class CurrencyListElement extends StatelessWidget {
    CurrencyListElement({
        super.key, 
        required this.code, 
        required this.name, 
        required this.callback, 
        required this.index
    });

    String code;
    String name;
    Function callback;
    int index;

    @override
    Widget build(BuildContext context) {
        double padding = Provider.of<ThemeProvider>(context).padding;
        Color? systemTextColor = CupertinoTheme.of(context).textTheme.textStyle.color;
        

        return Padding(
            padding: EdgeInsets.only(
                left: padding, 
                right: padding,
                top: index == 0 ? padding : 0,
                bottom: padding
            ),
            child: CupertinoButton(
                onPressed: () => callback(),
                padding: const EdgeInsets.all(10),
                color: secondaryColor,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Row(
                            children: <Widget>[
                                Flag(code: code),
                                const SizedBox(width: 20),
                                Text(
                                    name, 
                                    style: TextStyle(color: systemTextColor)
                                )
                            ],
                        ),
                        Text(
                            code,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: systemTextColor
                            )
                        )
                    ],
                ),
            ),
        );
    }
}