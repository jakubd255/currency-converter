// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'flag.dart';

class CurrencyCard extends StatelessWidget {
    CurrencyCard({
        super.key, 
        required this.currency,
        required this.amount,
        required this.navigate, 
    });

    Function navigate;
    String currency;
    String amount;

    @override
    Widget build(BuildContext context) {
        bool isDarkMode =  Provider.of<ThemeProvider>(context).isDarkMode;

        Color color = isDarkMode ? const Color.fromARGB(255, 15, 17, 18) : const Color.fromARGB(255, 255, 255, 255);
        Color textColor = isDarkMode ? Colors.white : Colors.black;

        double padding = Provider.of<ThemeProvider>(context).padding;

        return Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                        borderRadius: BorderRadius.circular(10),
                        padding: EdgeInsets.symmetric(
                            horizontal: padding*1.5,
                            vertical: padding*3.5
                        ),
                        color: color,
                        onPressed: () => navigate(),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Flag(code: currency),
                                        const SizedBox(height: 10),
                                        Text(currency, style: TextStyle(color: textColor)),
                                    ],
                                ),
                                Text(
                                    amount,
                                    style: TextStyle(
                                        fontSize: amount.length < 15 ? 35 : 20,
                                        color: textColor,
                                    ),
                                )
                            ],
                        )
                    ),
                ),
        );
    }
}