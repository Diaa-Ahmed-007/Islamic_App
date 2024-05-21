import 'package:flutter/material.dart';

class RadioProvider extends ChangeNotifier {
  int radioIndex = 0;
  incressRadioIndex() {
    radioIndex++;
    notifyListeners();
  }

  decresRadioIndex() {
    radioIndex--;
    notifyListeners();
  }

  lastPage() {
    radioIndex = 0;
    notifyListeners();
  }

  backPage(int newValue) {
    radioIndex = newValue;
    notifyListeners();
  }

  bool playAudio = false;
  changePlayAudioValue(bool newValue) {
    if (playAudio == newValue) return;
    playAudio = newValue;
    notifyListeners();
  }
}
