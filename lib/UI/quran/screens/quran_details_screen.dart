import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiy_app/UI/providers/settings_provider.dart';
import 'package:islamiy_app/UI/quran/models/quran_details_model.dart';
import 'package:islamiy_app/main.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class QuranDetailsScreen extends StatefulWidget {
  static const String routeName = 'QuranDetailsScreen';

  const QuranDetailsScreen({super.key});

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  @override
  Widget build(BuildContext context) {
     SettingsProvider provider = Provider.of<SettingsProvider>(context);
    final QuranDetailsModel details =
        ModalRoute.of(context)?.settings.arguments as QuranDetailsModel;
    if (lines.isEmpty) {
      readQuranFile(details.index);
    }
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
        body: lines.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            : Card(
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('سوره ${details.title}',
                            style: Theme.of(context).textTheme.displaySmall),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.play_circle,
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      color: Theme.of(context).colorScheme.primary,
                      height: 2,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: lines.length,
                        itemBuilder: (context, index) => Text(
                          '${lines[index]} (${index + 1})',
                          textDirection: TextDirection.rtl,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  List<String> lines = [];

  void readQuranFile(int index) async {
    String suraDetails =
        await rootBundle.loadString('assets/files/${index + 1}.txt');

    lines = suraDetails.trim().split('\n');
    print(lines);
    setState(() {});
  }
}
