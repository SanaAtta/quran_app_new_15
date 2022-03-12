import 'package:flutter/material.dart';

class SoundModel {
  String page_sound;
  String soundTitle;

  SoundModel({required this.page_sound, required this.soundTitle});
}

List<SoundModel> soundModelList = [
  SoundModel(soundTitle: "Sound 1", page_sound: "assets/sound/bookpage.mp3"),
  SoundModel(soundTitle: "Sound 2", page_sound: "assets/sound/notific.mp3"),
  SoundModel(soundTitle: "Sound 3", page_sound: "assets/sound/pageflip.mp3"),
  SoundModel(soundTitle: "Sound 4", page_sound: "assets/sound/turnThePage.mp3"),
  SoundModel(
      soundTitle: "Sound 5", page_sound: "assets/sound/veryShortNotif.mp3"),
];

class Themes {
  static final light = ThemeData.light().copyWith(primaryColor: Colors.white);
  static final dark = ThemeData.dark().copyWith(
    primaryColor: Colors.black,
  );
}
