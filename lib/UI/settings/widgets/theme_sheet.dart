import 'package:flutter/material.dart';
import 'package:islamiy_app/UI/providers/settings_provider.dart';
import 'package:islamiy_app/main.dart';
import 'package:provider/provider.dart';

class ThemeSheet extends StatelessWidget {
  const ThemeSheet({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          selectedTheme(provider.theme == ThemeMode.dark ? 'Dark' : 'Light',context),
          const SizedBox(
            height: 15,
          ),
          InkWell(
              onTap: () {
                provider.changeTheme(provider.theme == ThemeMode.dark
                    ? ThemeMode.light
                    : ThemeMode.dark);
              },
              child: unselectedTheme(
                  provider.theme == ThemeMode.dark ? 'Light' : 'Dark',context)),
        ],
      ),
    );
  }

  Widget selectedTheme(String language,BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          language,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Icon(
            Icons.check,
            color: Theme.of(context).colorScheme.primary,
            size: 30,
          ),
        )
      ],
    );
  }

  Widget unselectedTheme(String language,BuildContext context) {
    return Text(
      language,
      style: Theme.of(context).textTheme.labelSmall,
    );
  }
}
