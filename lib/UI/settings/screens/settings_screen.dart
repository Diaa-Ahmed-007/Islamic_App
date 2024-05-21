import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamiy_app/UI/providers/settings_provider.dart';
import 'package:islamiy_app/UI/settings/widgets/language_sheet.dart';
import 'package:islamiy_app/UI/settings/widgets/quran_reader_sheet.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            provider.getLanguage() == "en" ? 'Language' : 'اللغات',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () => languageBouttonSheet(context),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).colorScheme.primary,
                  )),
              padding: const EdgeInsets.all(16),
              child: Text(
                provider.getLanguage() == "en" ? 'English' : 'العربيه',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            provider.getLanguage() == "en" ? 'Theme' : 'السمات',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  provider.getThemeMode() == ThemeMode.dark
                      ? AppLocalizations.of(context)!.darkMode
                      : AppLocalizations.of(context)!.lightMode,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Switch(
                  inactiveTrackColor: Colors.black54,
                  inactiveThumbColor: Theme.of(context).colorScheme.primary,
                  value:
                      provider.getThemeMode() == ThemeMode.dark ? false : true,
                  onChanged: (value) {
                    provider.changeTheme(
                        provider.currentTheme == 'dark' ? 'light' : 'dark');
                  },
                )
              ],
            ),
          ),
          // InkWell(
          //   onTap: () => themeBouttonSheet(context),
          //   child: Container(
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(15),
          //         border: Border.all(
          //           width: 2,
          //           color: Theme.of(context).colorScheme.primary,
          //         )),
          //     padding: const EdgeInsets.all(16),
          //     child: Text(
          //       provider.getThemeMode() == ThemeMode.dark
          //           ? AppLocalizations.of(context)!.darkMode
          //           : AppLocalizations.of(context)!.lightMode,
          //       style: Theme.of(context).textTheme.bodyMedium,
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 60,
          ),
          Text(
            provider.getLanguage() == "en" ? 'Sheikh name' : 'اسم القارئ',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () => quranReaderBouttonSheet(context),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).colorScheme.primary,
                  )),
              padding: const EdgeInsets.all(16),
              child: Text(
                provider.quranReaderName,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void quranReaderBouttonSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const QuranReaderSheet();
        });
  }

  void languageBouttonSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const LanguageSheet();
        });
  }

  // void themeBouttonSheet(BuildContext context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (context) {
  //         return const ThemeSheet();
  //       });
  // }
}
