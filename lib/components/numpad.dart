// ignore_for_file: must_be_immutable

import 'package:currency_converter/providers/numpad_provider.dart';
import 'package:currency_converter/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/exchange_provider.dart';
import 'button.dart';

class Numpad extends StatelessWidget {
    const Numpad({super.key});

    @override
    Widget build(BuildContext context) {
        ExchangeProvider exchange = Provider.of<ExchangeProvider>(context);
        NumpadProvider numpad = Provider.of<NumpadProvider>(context);

        double padding = Provider.of<ThemeProvider>(context).padding;

        return(
            Expanded(
                flex: 4,
                child: Padding(
                padding: EdgeInsets.symmetric(horizontal: padding/2),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Expanded(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                    MyButton(
                                        text: "C",
                                        type: "special",
                                        callback: () => numpad.clear(),
                                    ),
                                    MyButton(
                                        icon: Icons.arrow_back,
                                        type: "special",
                                        callback: () => numpad.undo(),
                                    ),
                                    MyButton(
                                        icon: Icons.swap_horiz,
                                        type: "special",
                                        //callback: (){},
                                        callback: () => exchange.swap()
                                    ),
                                    MyButton(
                                        text: "/",
                                        type: "operator",
                                        callback: () => numpad.clickOperator("/"),
                                    )
                                ],
                            )
                        ),
                        Expanded(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                    MyButton(
                                        text: "7",
                                        callback: () => numpad.clickNumber("7"),
                                    ),
                                    MyButton(
                                        text: "8",
                                        callback: () => numpad.clickNumber("8"),
                                    ),
                                    MyButton(
                                        text: "9",
                                        callback: () => numpad.clickNumber("9"),
                                    ),
                                    MyButton(
                                        text: "*",
                                        type: "operator",
                                        callback: () => numpad.clickOperator("*"),
                                    )
                                ],
                            ),
                        ),
                        Expanded(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                    MyButton(
                                        text: "4",
                                        callback: () => numpad.clickNumber("4"),
                                    ),
                                    MyButton(
                                        text: "5",
                                        callback: () => numpad.clickNumber("5"),
                                    ),
                                    MyButton(
                                        text: "6",
                                        callback: () => numpad.clickNumber("6"),
                                    ),
                                    MyButton(
                                        text: "-",
                                        type: "operator",
                                        callback: () => numpad.clickOperator("-"),
                                    )
                                ],
                            ),
                        ),
                        Expanded(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                    MyButton(
                                        text: "1",
                                        callback: () => numpad.clickNumber("1"),
                                    ),
                                    MyButton(
                                        text: "2",
                                        callback: () => numpad.clickNumber("2"),
                                    ),
                                    MyButton(
                                        text: "3",
                                        callback: () => numpad.clickNumber("3"),
                                    ),
                                    MyButton(
                                        text: "+",
                                        type: "operator",
                                        callback: () => numpad.clickOperator("+"),
                                    )
                                ],
                            )
                        ),
                        Expanded(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                    MyButton(
                                        text: "0",
                                        callback: () => numpad.clickNumber("0"),
                                        flex: 2,
                                    ),
                                    MyButton(
                                        text: ".",
                                        callback: () => numpad.setPoint(),
                                    ),
                                    MyButton(
                                        text: "=",
                                        type: "operator",
                                        callback: () => numpad.clickEquals(),
                                    )
                                ],
                            ),
                        )
                    ],
                ),
            )
        )
            );
    }
}