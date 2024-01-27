import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class SettingsPage extends StatelessWidget {
    const SettingsPage({super.key});

    @override
    Widget build(BuildContext context) {
        final theme = Provider.of<ThemeProvider>(context);

        return(
            CupertinoPageScaffold(
                navigationBar: const CupertinoNavigationBar(
                    previousPageTitle: "Home",
                    middle: Text("Settings"),
                ),
                child: SafeArea(
                    bottom: false,
                    child: Column(
                        children: <Widget>[
                            CupertinoListSection.insetGrouped(
                                header: const Text("Theme"),
                                backgroundColor: Colors.transparent,
                                dividerMargin: -25,
                                children: <CupertinoListTile>[
                                    CupertinoListTile(
                                        onTap: (){
                                            theme.setTheme("auto", context);
                                        },
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        title: const Text("Automatic"),
                                        leading: getThemeChoiceIcon(theme, "auto")
                                    ),
                                    CupertinoListTile(
                                        onTap: (){
                                            theme.setTheme("light", context);
                                        },
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        title: const Text("Light"),
                                        leading: getThemeChoiceIcon(theme, "light")
                                    ),
                                    CupertinoListTile(
                                        onTap: (){
                                            theme.setTheme("dark", context);
                                        },
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        title: const Text("Dark"),
                                        leading: getThemeChoiceIcon(theme, "dark")
                                    ),
                                ],
                            ),

                            CupertinoListSection.insetGrouped(
                                header: const Text("Color"),
                                backgroundColor: Colors.transparent,
                                dividerMargin: -25,
                                children: List<CupertinoListTile>.generate(
                                    theme.colors.length,
                                    (index) => CupertinoListTile(
                                        onTap: (){
                                            theme.setColor(index);
                                        },
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        title: Text(theme.colorNames[index]),
                                        leading:  getColorChoiceIcon(theme, index)
                                    )
                                ).toList()
                            )
                        ],
                    )
                ),
            )
        );
    }

    Icon getThemeChoiceIcon(ThemeProvider theme, String choice) {
        if(theme.choice == choice) {
            return const Icon(Icons.check_circle);
        }
        else {
            return const Icon(Icons.radio_button_unchecked, color: Colors.grey);
        }
    }

    Icon getColorChoiceIcon(ThemeProvider theme, int index) {
        if(theme.colorIndex == index) {
            return const Icon(Icons.check_circle);
        }
        else {
            return Icon(
                Icons.circle,
                color: theme.colors[index]
            );
        }
    }
}