import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamiy_app/UI/hadeth/screens/ahadeth_screen.dart';
import 'package:islamiy_app/UI/providers/settings_provider.dart';
import 'package:islamiy_app/UI/quran/screens/quran_screen.dart';
import 'package:islamiy_app/UI/radio/radio_screen.dart';
import 'package:islamiy_app/UI/sebha/sebha_screen.dart';
import 'package:islamiy_app/UI/settings/screens/settings_screen.dart';
import 'package:islamiy_app/main.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
      
  int index = 0;
  List<Widget> navWidget = [
    const QuranWidget(),
    const AhadethScreen(),
    const SebhaWidget(),
    const RadioWidget(),
    const SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
     SettingsProvider provider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: provider.theme==ThemeMode.dark
              ? const AssetImage('assets/images/Dakbg.png')
              : const AssetImage('assets/images/bg3.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.islamy),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                icon: const ImageIcon(
                  AssetImage('assets/images/Path 1.png'),
                ),
                label: AppLocalizations.of(context)!.quran),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                icon: const ImageIcon(
                  AssetImage('assets/images/moshaf_blue.png'),
                ),
                label: AppLocalizations.of(context)!.ahadeth),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                icon: const ImageIcon(
                  AssetImage('assets/images/sebha_blue.png'),
                ),
                label: AppLocalizations.of(context)!.sebha),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                icon: const ImageIcon(
                  AssetImage('assets/images/radio_blue.png'),
                ),
                label: AppLocalizations.of(context)!.radio),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                icon: const ImageIcon(
                  AssetImage('assets/images/settings.256x256.png'),
                ),
                label: AppLocalizations.of(context)!.settings),
          ],
        ),
        body: navWidget[index],
      ),
    );
  }
}
