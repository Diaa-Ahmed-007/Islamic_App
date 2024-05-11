import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamiy_app/UI/Themes/dark_theme.dart';
import 'package:islamiy_app/UI/Themes/light_theme.dart';
import 'package:islamiy_app/UI/hadeth/screens/hadeth_body_screen.dart';
import 'package:islamiy_app/UI/home/home_screen.dart';
import 'package:islamiy_app/UI/providers/radio_provider.dart';
import 'package:islamiy_app/UI/providers/settings_provider.dart';
import 'package:islamiy_app/UI/quran/screens/quran_details_screen.dart';
import 'package:islamiy_app/UI/splash/splash_screen.dart';
import 'package:islamiy_app/api/api_manger.dart';
import 'package:provider/provider.dart';

void main() {
  ApiManger.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider<SettingsProvider>(
    child: const MyApp(),
    create: (context) => SettingsProvider()
      ..initializeLanguage()
      ..initializeTheme()..initializeQuranReaderName(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(provider.getLanguage()),
      routes: {
        HomeScreen.routeName: (_) => ChangeNotifierProvider(
            create: (context) => RadioProvider(), child: const HomeScreen()),
        SplashScreen.routeName: (_) => const SplashScreen(),
        QuranDetailsScreen.routeName: (_) => const QuranDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => const HadethDetailsScreen(),
      },
      initialRoute: SplashScreen.routeName,
      theme: LightTheme.themeData,
      darkTheme: DarkTheme.themeData,
      themeMode: provider.getThemeMode(),
    );
  }
}
