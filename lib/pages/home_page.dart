import 'package:currency_converter/providers/exchange_provider.dart';
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

        return CupertinoPageScaffold(
            child: SafeArea(
                child: Column(
                    children: <Widget>[
                        CurrencyCard(
                            currency: exchange.from,
                            amount: numpad.displayedNum,
                            navigate: (){
                                navigateCurrencyList("from");
                            }
                        ),
                        CurrencyCard(
                            currency: exchange.to,
                            amount: exchange.convert(double.parse(numpad.displayedNum)),
                            navigate: (){
                                navigateCurrencyList("to");
                            }
                        ),
                        const Numpad(),
                        const Footer()
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