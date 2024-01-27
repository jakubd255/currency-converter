import 'package:currency_converter/pages/home_page.dart';
import 'package:currency_converter/providers/exchange_provider.dart';
import 'package:currency_converter/providers/numpad_provider.dart';
import 'package:currency_converter/providers/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main() {
    runApp(
        MultiProvider(
            providers: [
                ChangeNotifierProvider<ThemeProvider>(
                    create: (context) => ThemeProvider(context),
                ),
                ChangeNotifierProvider<ExchangeProvider>(
                    create: (context) => ExchangeProvider(context),
                ),
                ChangeNotifierProvider<NumpadProvider>(
                    create: (context) => NumpadProvider(context),
                ),
            ],
            child: const MyApp(),
        ),
    );
}

class MyApp extends StatefulWidget {
    const MyApp({super.key});
    
    @override
    State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    bool _isLoading = true;

    @override
    void didChangeDependencies() {
        super.didChangeDependencies();

        if(_isLoading) {
            context.read<ThemeProvider>().initialize(context);
            context.read<ExchangeProvider>().initialize();
            _isLoading = false;
        }
    }

    @override
    Widget build(BuildContext context) {
        return CupertinoApp(
            debugShowCheckedModeBanner: false,
            title: "Currency Converter",
            theme: CupertinoThemeData(
                primaryColor: Provider.of<ThemeProvider>(context).primaryColor,
                scaffoldBackgroundColor: const CupertinoDynamicColor.withBrightness(
                    color: Color.fromARGB(255, 240, 240, 240),
                    darkColor: Color.fromARGB(255, 35, 35, 35),
                ),
                brightness: Provider.of<ThemeProvider>(context).isDarkMode ? Brightness.dark : Brightness.light,
            ),
            home: const HomePage(),
        );
    }
}