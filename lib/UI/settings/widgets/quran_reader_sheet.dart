import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islamiy_app/UI/providers/settings_provider.dart';
import 'package:islamiy_app/json/model/QuranResponse.dart';
import 'package:islamiy_app/json/quran_sound.dart';
import 'package:provider/provider.dart';

class QuranReaderSheet extends StatefulWidget {
  const QuranReaderSheet({super.key});

  @override
  State<QuranReaderSheet> createState() => _QuranReaderSheetState();
}

class _QuranReaderSheetState extends State<QuranReaderSheet> {
  late List<QuranModel> quranLisr;
  final player = AudioPlayer();
  List<String> filter = [];
  late int index;
  @override
  void initState() {
    fillTheQuranList(context: context);
    filter = quranLisr
        .map(
          (e) => e.name ?? "",
        )
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextFormField(
              onChanged: (value) {
                filterd(value);
              },
              cursorWidth: 1,
              cursorHeight: 22,
              style: Theme.of(context).textTheme.headlineSmall,
              cursorColor: Theme.of(context).colorScheme.inversePrimary,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 5),
                fillColor: Theme.of(context).colorScheme.secondary,
                filled: true,
                suffixIconColor: Colors.white,
                prefixIconColor: Colors.red,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintText: "search",
                hintStyle: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontSize: 20, fontWeight: FontWeight.w300),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: const BorderSide(color: Colors.white54, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: const BorderSide(color: Colors.white, width: 2),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          selectedLanguage(context, provider.quranReaderName),
          const SizedBox(
            height: 15,
          ),
          unSelectedLanguage(quranLisr, context),
        ],
      ),
    );
  }

  filterd(String value) {
    setState(() {
      filter = quranLisr
          .map(
            (e) => e.name ?? "",
          )
          .where(
            (element) => element.contains(value),
          )
          .toList();
    });
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

  Widget unSelectedLanguage(List<QuranModel> quranLisr, BuildContext context) {
    SettingsProvider provider =
        Provider.of<SettingsProvider>(context, listen: false);
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Theme.of(context).colorScheme.primary,
        ),
        itemCount: filter.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              provider.changeQuranReaderName(filter[index]);
              Navigator.pop(context);
            },
            child: Text(
              filter[index],
              style: Theme.of(context).textTheme.labelSmall,
            ),
          );
        },
      ),
    );
  }

  fillTheQuranList({required BuildContext context}) {
    SettingsProvider provider =
        Provider.of<SettingsProvider>(context, listen: false);
    QuranResponse response = QuranResponse.fromJson(
        provider.getLanguage() == "en"
            ? QuranSound.englishQuranJson
            : QuranSound.arabicQuranJson);
    quranLisr = response.reciters
            ?.map(
              (e) => QuranModel(name: e.name, url: e.server),
            )
            .toList() ??
        [];
  }
}

class QuranModel {
  String? name;
  String? url;
  QuranModel({required this.name, required this.url});
}
