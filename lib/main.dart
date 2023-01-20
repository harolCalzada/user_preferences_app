import 'package:flutter/material.dart';
import 'package:preferences_user_app/providers/theme_provider.dart';
import 'package:preferences_user_app/screens/home_screen.dart';
import 'package:preferences_user_app/screens/settings_screen.dart';
import 'package:preferences_user_app/share_preferences.dart/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(child: const MyApp(), providers: [
    ChangeNotifierProvider(
        create: (_) => ThemeProvider(isDarkMode: Preferences.isDarkMode)),
  ])
      // const MyApp()

      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material All',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName: (context) => HomeScreen(),
        SettingsScreen.routerName: (context) => SettingsScreen()
      },
      // theme: Provider.<ThemeProvider>of(context).currentTheme,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
