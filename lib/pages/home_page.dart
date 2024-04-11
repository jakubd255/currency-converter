import 'package:currency_converter/providers/exchange_provider.dart';
import 'package:currency_converter/providers/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../providers/numpad_provider.dart';
import '../components/currency_card.dart';
import '../components/footer.dart';
import '../components/numpad.dart';
import 'currency_list_page.dart';

class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    @override
    Widget build(BuildContext context) {
        ExchangeProvider exchange = Provider.of<ExchangeProvider>(context);
        NumpadProvider numpad = Provider.of<NumpadProvider>(context);
        double padding = Provider.of<ThemeProvider>(context).padding;

        return CupertinoPageScaffold(
            child: SafeArea(
                child: Column(
                    children: <Widget>[
                        SizedBox(height: padding),
                        CurrencyCard(
                            currency: exchange.from,
                            amount: numpad.displayedNum,
                            navigate: (){
                                navigateCurrencyList("from");
                            }
                        ),
                        SizedBox(height: padding),
                        CurrencyCard(
                            currency: exchange.to,
                            amount: exchange.convert(double.parse(numpad.displayedNum)),
                            navigate: (){
                                navigateCurrencyList("to");
                            }
                        ),
                        SizedBox(height: padding),
                        const Numpad(),
                        const Footer(),
                    ],
                )
            ),
        );
    }

    void navigateCurrencyList(String choice) {
        Navigator.push(context, CupertinoPageRoute(
            builder: (context) => CurrencyListPage(choice: choice))
        );
    }
}