// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/settings_page.dart';
import '../providers/exchange_provider.dart';
import 'package:provider/provider.dart';

class Footer extends StatelessWidget {
    const Footer({super.key});

    @override
    Widget build(BuildContext context) {
        ExchangeProvider exchange = Provider.of<ExchangeProvider>(context);

        return(
            Padding(
                padding: const EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 4),
                child: Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                            Text("1 ${exchange.from} = ${exchange.convert(1)} ${exchange.to}"),
                            Row(
                                children: <Widget>[
                                    CupertinoButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                            Navigator.push(context, CupertinoPageRoute(
                                                builder: (context) => const SettingsPage())
                                            );
                                        },
                                        child: const Icon(Icons.settings)
                                    )
                                ],
                            )
                        ],
                    )
                ),
            )
        );
    }
}