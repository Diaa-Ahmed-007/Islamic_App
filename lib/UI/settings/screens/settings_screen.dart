import 'package:flutter/material.dart';
import 'package:islamiy_app/UI/providers/settings_provider.dart';
import 'package:islamiy_app/UI/settings/widgets/language_sheet.dart';
import 'package:islamiy_app/UI/settings/widgets/theme_sheet.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
            provider.Language == "en" ? 'Language' : 'اللغات',
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
                provider.Language == "en" ? 'English' : 'العربيه',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            provider.Language == "en" ? 'Theme' : 'السمات',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () => themeBouttonSheet(context),
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
                provider.theme == ThemeMode.dark ? AppLocalizations.of(context)!.darkMode :AppLocalizations.of(context)!.lightMode,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          )
        ],
      ),
    );
  }

  void languageBouttonSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const LanguageSheet();
        });
  }

  void themeBouttonSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const ThemeSheet();
        });
  }
}
