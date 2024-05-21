import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islamiy_app/UI/providers/quran_provider.dart';
import 'package:islamiy_app/UI/providers/settings_provider.dart';
import 'package:islamiy_app/UI/quran/models/quran_details_model.dart';
import 'package:islamiy_app/json/model/QuranResponse.dart';
import 'package:islamiy_app/json/model/Reciters.dart';
import 'package:islamiy_app/json/quran_sound.dart';
import 'package:provider/provider.dart';

class QuranPlayerBar extends StatefulWidget {
  const QuranPlayerBar({
    super.key,
  });

  @override
  State<QuranPlayerBar> createState() => _QuranPlayerBarState();
}

class _QuranPlayerBarState extends State<QuranPlayerBar> {
  late List<Reciters> quranPlayer;
  @override
  void initState() {
    super.initState();
    quranPlayer = fillTheQuranList(context: context);
  }

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    QuranProvider quranProvider = Provider.of<QuranProvider>(context);
    late Duration current = quranProvider.currentDuration;
    late Duration totalTime = quranProvider.totalDuration;
    int number = quranProvider.suraIndex + 1;

    var indexInThreeDiget = number.toString().padLeft(3, '0');
    return Container(
      height: 110,
      width: double.infinity,
      color: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        quranProvider.quranPlayer.stop();
                        quranProvider.changeIsQuranPlaybarVisable(false);
                      },
                      icon: const Icon(
                        Icons.cancel,
                        color: Colors.white,
                        size: 30,
                      )),
                  Text(
                    "سوره ${QuranDetailsModel.suraNames[quranProvider.suraIndex]}",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  formatDuration(current.inSeconds),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                Slider(
                  activeColor: provider.getThemeMode() == ThemeMode.dark
                      ? Theme.of(context).colorScheme.primary
                      : Colors.black,
                  inactiveColor: Colors.grey[300],
                  max: totalTime.inSeconds.toDouble(),
                  min: 0,
                  value: current.inSeconds.toDouble(),
                  onChanged: (value) {
                    current = Duration(seconds: value.toInt());
                    setState(() {});
                    quranProvider.changeCurrent(value);
                    quranProvider.listenToDuration();
                    quranProvider.quranPlayer.seek(current);
                  },
                ),
                Text(
                  formatDuration(totalTime.inSeconds),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // s
                IconButton(
                    iconSize: 35,
                    padding: const EdgeInsets.all(0),
                    onPressed: () async {
                      if (quranProvider.isQuranPlay) {
                        await quranProvider.quranPlayer.pause();
                        quranProvider.changeIsQuranPlay(false);
                        setState(() {});
                      } else {
                        await quranProvider.quranPlayer.resume();
                        quranProvider.changeIsQuranPlay(true);
                        setState(() {});
                      }
                    },
                    icon: Icon(
                      quranProvider.isQuranPlay
                          ? Icons.pause
                          : Icons.play_arrow_rounded,
                    )),
                // GestureDetector(
                //   onTap: nextSura,
                //   child: const Icon(Icons.skip_next_sharp),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }


  previosSura() async {
    QuranProvider quranProvider =
        Provider.of<QuranProvider>(context, listen: false);

    int number = quranProvider.suraIndex - 1;

    var indexInThreeDiget = number.toString().padLeft(3, '0');
    log(indexInThreeDiget);
    if (number == 0) return;
    await quranProvider.quranPlayer.stop();
    await quranProvider.quranPlayer.play(
      UrlSource("${quranPlayer[0].server}/$indexInThreeDiget.mp3"),
    );
    quranProvider.totalDuration =
        await quranProvider.quranPlayer.getDuration() ?? Duration.zero;
    quranProvider.changeSuraIndex(number);
    quranProvider.changeIsQuranPlay(true);
    quranProvider.changeElevetionContainer(true);
    await Future.delayed(
      const Duration(milliseconds: 40),
      () {
        quranProvider.changeElevetionContainer(false);
      },
    );
  }

  nextSura() async {
    QuranProvider quranProvider =
        Provider.of<QuranProvider>(context, listen: false);
    int number = quranProvider.suraIndex + 1;
    var indexInThreeDiget = number.toString().padLeft(3, '0');
    log(indexInThreeDiget);
    if (number == 114) return;
    await quranProvider.quranPlayer.stop();
    await quranProvider.quranPlayer.play(
      UrlSource("${quranPlayer[0].server}/$indexInThreeDiget.mp3"),
    );
    quranProvider.totalDuration =
        await quranProvider.quranPlayer.getDuration() ?? Duration.zero;
    quranProvider.changeIsQuranPlay(true);
    quranProvider.changeSuraIndex(number);
    quranProvider.changeElevetionContainer(true);
    await Future.delayed(
      const Duration(milliseconds: 40),
      () {
        quranProvider.changeElevetionContainer(false);
      },
    );
  }

  String formatDuration(int totalSeconds) {
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
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
