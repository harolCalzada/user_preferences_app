import 'package:flutter/material.dart';
import 'package:preferences_user_app/providers/theme_provider.dart';
import 'package:preferences_user_app/share_preferences.dart/preferences.dart';
import 'package:preferences_user_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routerName = 'Settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool isDarkMode = false;
  // int gender = 1;
  // String name = 'Harol';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        drawer: const SideMenu(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Settings',
                    style:
                        TextStyle(fontSize: 45, fontWeight: FontWeight.w300)),
                const Divider(),
                SwitchListTile.adaptive(
                    title: Text('Darkmode'),
                    value: Preferences.isDarkMode,
                    onChanged: (value) {
                      Preferences.isDarkMode = value;
                      final themeProvider =
                          Provider.of<ThemeProvider>(context, listen: false);
                      value
                          ? themeProvider.setDarkMode()
                          : themeProvider.setLightMode();

                      setState(() {});
                    }),
                Divider(),
                RadioListTile<int>(
                    title: Text('Masculino'),
                    value: 1,
                    groupValue: Preferences.gender,
                    onChanged: (value) {
                      Preferences.gender = value ?? 1;
                      setState(() {});
                    }),
                Divider(),
                RadioListTile<int>(
                    title: Text('Femenino'),
                    value: 2,
                    groupValue: Preferences.gender,
                    onChanged: (value) {
                      Preferences.gender = value ?? 2;
                      setState(() {});
                    }),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    initialValue: Preferences.name,
                    decoration: const InputDecoration(
                        labelText: 'Nombre', helperText: 'Nombre del usuario'),
                    onChanged: (value) {
                      Preferences.name = value;
                      setState(() {});
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
