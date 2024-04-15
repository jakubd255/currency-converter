import 'package:currency_converter/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class SettingsPage extends StatelessWidget {
    const SettingsPage({super.key});

    @override
    Widget build(BuildContext context) {
        final theme = Provider.of<ThemeProvider>(context);

        Icon getThemeChoiceIcon(String choice) {
            if(theme.choice == choice) {
                return const Icon(Icons.check_circle);
            }
            else {
                return const Icon(
                    Icons.radio_button_unchecked, 
                    color: Colors.grey
                );
            }
        }

        Icon getColorChoiceIcon(int index) {
            if(theme.colorIndex == index) {
                return const Icon(Icons.check_circle);
            }
            else {
                return Icon(
                    Icons.circle,
                    color: themeColors[index].primary
                );
            }
        }

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
                                            theme.setBrightness("system");
                                        },
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        title: const Text("System"),
                                        leading: getThemeChoiceIcon("system")
                                    ),
                                    CupertinoListTile(
                                        onTap: (){
                                            theme.setBrightness("light");
                                        },
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        title: const Text("Light"),
                                        leading: getThemeChoiceIcon("light")
                                    ),
                                    CupertinoListTile(
                                        onTap: (){
                                            theme.setBrightness("dark");
                                        },
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        title: const Text("Dark"),
                                        leading: getThemeChoiceIcon("dark")
                                    ),
                                ],
                            ),

                            CupertinoListSection.insetGrouped(
                                header: const Text("Color"),
                                backgroundColor: Colors.transparent,
                                dividerMargin: -25,
                                children: List<CupertinoListTile>.generate(
                                    themeColors.length,
                                    (index) => CupertinoListTile(
                                        onTap: (){
                                            theme.setColor(index);
                                        },
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        title: Text(themeColors[index].name),
                                        leading:  getColorChoiceIcon(index)
                                    )
                                ).toList()
                            )
                        ],
                    )
                ),
            )
        );
    }
}