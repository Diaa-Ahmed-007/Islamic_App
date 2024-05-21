import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:islamiy_app/UI/providers/quran_provider.dart';
import 'package:islamiy_app/UI/providers/settings_provider.dart';
import 'package:islamiy_app/UI/quran/models/quran_details_model.dart';
import 'package:islamiy_app/UI/quran/screens/quran_details_screen.dart';
import 'package:islamiy_app/json/model/QuranResponse.dart';
import 'package:islamiy_app/json/model/Reciters.dart';
import 'package:islamiy_app/json/quran_sound.dart';
import 'package:provider/provider.dart';

class QuranItem extends StatefulWidget {
  final String suraName;
  final String suraNumber;
  final int index;
  const QuranItem(
      {super.key,
      required this.suraName,
      required this.suraNumber,
      required this.index});

  @override
  State<QuranItem> createState() => _QuranItemState();
}

class _QuranItemState extends State<QuranItem> {
  late List<Reciters> quranPlayer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quranPlayer = fillTheQuranList(context: context);
  }

  @override
  Widget build(BuildContext context) {
    QuranProvider quranProvider = Provider.of<QuranProvider>(context);
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    int number = widget.index + 1;
    var indexInThreeDiget = number.toString().padLeft(3, '0');
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, QuranDetailsScreen.routeName,
            arguments:
                QuranDetailsModel(title: widget.suraName, index: widget.index));
      },
      child: Slidable(
        direction: Axis.horizontal,
        startActionPane: ActionPane(motion: const BehindMotion(), children: [
          CustomSlidableAction(
            onPressed: (_) async {
              await quranProvider.quranPlayer
                  .play(
                UrlSource("${quranPlayer[0].server}/$indexInThreeDiget.mp3"),
              )
                  .then(
                (value) async {
                  quranProvider.totalDuration =
                      await quranProvider.quranPlayer.getDuration() ??
                          Duration.zero;
                },
              );
              quranProvider.changeSuraIndex(widget.index);
              quranProvider.changeIsQuranPlaybarVisable(true);
              quranProvider.changeIsQuranPlay(true);
            },
            backgroundColor: Colors.transparent,
            autoClose: true,
            child: Icon(
              Icons.play_arrow_rounded,
              size: 30,
              color: provider.getThemeMode() == ThemeMode.light
                  ? Colors.black
                  : Colors.white,
            ),
          ),
        ]),
        child: Row(
          children: [
            Expanded(
                child: Text(
              widget.suraName,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            )),
            Container(
              width: 4,
              height: 45,
              color: Theme.of(context).colorScheme.primary,
            ),
            Expanded(
              child: Text(widget.suraNumber,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          ],
        ),
      ),
    );
  }

  List<Reciters> fillTheQuranList({required BuildContext context}) {
    SettingsProvider provider =
        Provider.of<SettingsProvider>(context, listen: false);
    QuranResponse response = QuranResponse.fromJson(
        provider.getLanguage() == "en"
            ? QuranSound.englishQuranJson
            : QuranSound.arabicQuranJson);
    List<Reciters> quran = response.reciters
            ?.where(
              (element) =>
                  element.name?.contains(provider.quranReaderName) ?? false,
            )
            .toList() ??
        [];
    log(quran[0].server ?? "");
    return quran;
  }
}
