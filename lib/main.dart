import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'Onboarding/OBScreen.dart';
import 'Splash.dart';
import 'Utility/ThemeProvider.dart';

bool? isFirstTimeView;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  isFirstTimeView = preferences.getBool('isFirstTimeView') ?? true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) {
        ThemeProvider provider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: provider.themeMode,
          theme:
              ThemeData(colorScheme: provider.colorScheme, fontFamily: 'Nunito'),
          title: "A/WQI",
          home: isFirstTimeView == true ? const OBScreen() : const Splash(),
        );
      },
    );
  }
}
