import 'package:flutter/material.dart';

class LanguageSheet extends StatelessWidget {
  const LanguageSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          selectedLanguage(context, 'English'),
          const SizedBox(
            height: 15,
          ),
          unSelectedLanguage('Arabic', context),
        ],
      ),
    );
  }

  Widget selectedLanguage(BuildContext context, String language) {
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

  Widget unSelectedLanguage(String language, BuildContext context) {
    return Text(
      language,
      style: Theme.of(context).textTheme.labelSmall,
    );
  }
}
