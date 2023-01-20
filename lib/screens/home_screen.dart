import 'package:flutter/material.dart';
import 'package:preferences_user_app/share_preferences.dart/preferences.dart';
import 'package:preferences_user_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routerName = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('isDarkmode: ${Preferences.isDarkMode}'),
          Divider(),
          Text('Genero: ${Preferences.gender}'),
          Divider(),
          Text('Nombre de usuario: ${Preferences.name}'),
          Divider()
        ],
      ),
    );
  }
}
