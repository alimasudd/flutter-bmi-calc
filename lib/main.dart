import 'package:bmi_calculator/constants/theme.dart';
import 'package:bmi_calculator/provider/theme_provider.dart';
import 'package:bmi_calculator/screens/calculator/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'provider/bmi_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: ((context) => Mass())),
          ChangeNotifierProvider(create: ((context) => ThemeProvider()))
        ],
        child: Consumer<ThemeProvider>(builder: (context, value, _) {
          return Sizer(
            builder: ((context, orientation, deviceType) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: Themes.themesData(value.isDark, context),
                home: const HomeScreen(),
              );
            }),
          );
        }));
  }
}
