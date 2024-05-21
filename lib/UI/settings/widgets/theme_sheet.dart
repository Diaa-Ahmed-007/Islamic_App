// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:islamiy_app/UI/providers/settings_provider.dart';
// import 'package:provider/provider.dart';

// class ThemeSheet extends StatelessWidget {
//   const ThemeSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     SettingsProvider provider = Provider.of<SettingsProvider>(context);
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           selectedTheme(
//               provider.getThemeMode() == ThemeMode.dark
//                   ? AppLocalizations.of(context)!.darkMode
//                   : AppLocalizations.of(context)!.lightMode,
//               context),
//           const SizedBox(
//             height: 15,
//           ),
//           InkWell(
//               onTap: () {
//                 provider.changeTheme(
//                     provider.currentTheme == 'dark' ? 'light' : 'dark');
//                 Navigator.pop(context);
//               },
//               child: unselectedTheme(
//                   provider.getThemeMode() == ThemeMode.dark
//                       ? AppLocalizations.of(context)!.lightMode
//                       : AppLocalizations.of(context)!.darkMode,
//                   context)),
//         ],
//       ),
//     );
//   }

//   Widget selectedTheme(String language, BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           language,
//           style: Theme.of(context).textTheme.displayMedium,
//         ),
//         Padding(
//           padding: const EdgeInsets.only(right: 16),
//           child: Icon(
//             Icons.check,
//             color: Theme.of(context).colorScheme.primary,
//             size: 30,
//           ),
//         )
//       ],
//     );
//   }

//   Widget unselectedTheme(String language, BuildContext context) {
//     return Text(
//       language,
//       style: Theme.of(context).textTheme.labelSmall,
//     );
//   }
// }
