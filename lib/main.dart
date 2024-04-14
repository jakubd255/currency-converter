import 'package:currency_converter/pages/home_page.dart';
import 'package:currency_converter/providers/exchange_provider.dart';
import 'package:currency_converter/providers/numpad_provider.dart';
import 'package:currency_converter/providers/theme_provider.dart';
import 'package:currency_converter/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
    await Hive.initFlutter();
    await Hive.openBox("myBox");

    runApp(
        MultiProvider(
            providers: [
                ChangeNotifierProvider<ThemeProvider>(
                    create: (context) => ThemeProvider(),
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
            context.read<ExchangeProvider>().initialize(context);
            _isLoading = false;
        }
    }

    @override
    Widget build(BuildContext context) {
        final theme = Provider.of<ThemeProvider>(context);
        return CupertinoApp(
            debugShowCheckedModeBanner: false,
            title: "Currency Converter",
            theme: CupertinoThemeData(
                scaffoldBackgroundColor: primaryColor,
                primaryColor: theme.themeColor.primary,
                brightness: theme.getBrightness(context),
                textTheme: CupertinoTextThemeData(
                    textStyle: TextStyle(
                        color: textColor,
                    ),
                    primaryColor: theme.themeColor.primary
                ),
            ),
            home: const HomePage(),
        );
    }
}