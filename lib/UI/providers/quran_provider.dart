import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class QuranProvider extends ChangeNotifier {
  final quranPlayer = AudioPlayer();

  Duration currentDuration = Duration.zero;
  Duration totalDuration = Duration.zero;
  void listenToDuration() {
    quranPlayer.onDurationChanged.listen(
      (newDuration) {
        totalDuration = newDuration;
        notifyListeners();
      },
    );
    quranPlayer.onPositionChanged.listen(
      (newPosition) {
        currentDuration = newPosition;
        notifyListeners();
      },
    );
  }

  changeCurrent(double val) {
    if (currentDuration == Duration(seconds: val.toInt())) return;
    currentDuration = Duration(seconds: val.toInt());
    notifyListeners();
  }

  bool isQuranPlay = false;
  changeIsQuranPlay(bool newValue) {
    if (isQuranPlay == newValue) return;
    isQuranPlay = newValue;
    notifyListeners();
  }

  bool isQuranPlaybarVisable = false;
  changeIsQuranPlaybarVisable(bool newValue) {
    if (isQuranPlaybarVisable == newValue) return;
    isQuranPlaybarVisable = newValue;
    notifyListeners();
  }

  int suraIndex = 0;
  void changeSuraIndex(int newValue) {
    if (suraIndex == newValue) return;
    suraIndex = newValue;
    notifyListeners();
  }

  bool elevetionContainer = false;
  void changeElevetionContainer(bool newValue) {
    if (elevetionContainer == newValue) return;
    elevetionContainer = newValue;
    notifyListeners();
  }
}
