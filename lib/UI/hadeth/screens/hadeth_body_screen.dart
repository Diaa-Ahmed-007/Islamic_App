import 'package:flutter/material.dart';
import 'package:islamiy_app/UI/hadeth/models/hadeth_model.dart';
import 'package:islamiy_app/UI/providers/settings_provider.dart';
import 'package:islamiy_app/main.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatelessWidget {
  const HadethDetailsScreen({super.key});
  static const String routeName = 'HadethDetailsScreen';
  @override
  Widget build(BuildContext context) {
     SettingsProvider provider = Provider.of<SettingsProvider>(context);
    HadethModel hadethDetails =
        ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: provider.theme==ThemeMode.dark
              ? const AssetImage('assets/images/Dakbg.png')
              : const AssetImage('assets/images/bg3.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: const Text(
            'Islami',
          ),
        ),
        body: hadethDetails.body.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            : Card(
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(hadethDetails.label,
                        style: Theme.of(context).textTheme.displaySmall),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      color: Theme.of(context).colorScheme.primary,
                      height: 2,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Text(hadethDetails.body,
                              textDirection: TextDirection.rtl,
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
