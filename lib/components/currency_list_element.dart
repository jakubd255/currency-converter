// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'flag.dart';

class CurrencyListElement extends StatelessWidget {
    CurrencyListElement({super.key, required this.code, required this.name, required this.callback});

    String code;
    String name;
    Function callback;

    @override
    Widget build(BuildContext context) {
        bool isDarkMode =  Provider.of<ThemeProvider>(context).isDarkMode;
        
        Color color = isDarkMode ? const Color.fromARGB(255, 15, 17, 18) : const Color.fromARGB(255, 255, 255, 255);
        Color textColor = isDarkMode ? Colors.white : Colors.black;

        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: CupertinoButton(
                onPressed: () => callback(),
                padding: const EdgeInsets.all(10),
                color: color,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Row(
                            children: <Widget>[
                                Flag(code: code),
                                const SizedBox(width: 20),
                                Text(name, style: TextStyle(color: textColor))
                            ],
                        ),
                        Text(
                            code,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: textColor
                            )
                        )
                    ],
                ),
            ),
        );
    }
}