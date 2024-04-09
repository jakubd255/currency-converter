// ignore_for_file: depend_on_referenced_packages

import 'package:currency_converter/providers/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../constants/currencies.dart';
import '../providers/exchange_provider.dart';
import '../components/currency_list_element.dart';

class CurrencyListPage extends StatefulWidget {
    const CurrencyListPage({
        super.key,
        required this.choice,
    });

    final String choice;

    @override
    State<CurrencyListPage> createState() => _CurrencyListPageState();
}

class _CurrencyListPageState extends State<CurrencyListPage> {
    final ScrollController _scrollController = ScrollController();

    @override
    Widget build(BuildContext context) {
        ExchangeProvider state = Provider.of<ExchangeProvider>(context);
        double padding = Provider.of<ThemeProvider>(context).padding;

        return CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
                previousPageTitle: "Home",
                middle: Text("Currencies"),
            ),
            child: CupertinoScrollbar(
                controller: _scrollController,
                child: ListView.builder(
                    controller: _scrollController,
                    itemCount: currencies.length,
                    itemBuilder: (context, index) {
                        return CurrencyListElement(
                            name: currencies[index].name,
                            code: currencies[index].code,
                            callback: () {
                                state.chooseCurrency(widget.choice, currencies[index].code);
                                Navigator.pop(context);
                            },
                            index: index
                        );
                    },
                ),
            )
        );
    }
}