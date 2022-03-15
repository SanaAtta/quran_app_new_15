import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quran_app_new/model/sound_model.dart';

class MainController extends GetxController {
  var viewVisible = false.obs;
  var isPlaying = false.obs;
  var isDarkMode = false.obs;

  var isVisibleOverlay = false.obs;
  var isVisibleText = false.obs;
  var isVisibleSound = false.obs;

  var player = AudioPlayer().obs;
  String audioasset = "assets/sound/meao.mp3";
  var volume_icon = SvgPicture.asset("assets/dialog/volume_selected.svg").obs;
  var mute_icon = SvgPicture.asset("assets/dialog/volume.svg").obs;
  int soundIndex = 0;
  var paraCount = 0.obs;
  var surahCount = 0.obs;

  void showWidget() {
    viewVisible.value = true;
  }

  void hideWidget() {
    viewVisible.value = false;
  }

  play() {
    player.value.play(soundModelList[soundIndex].page_sound);
    isPlaying.value = true;
  }

  stop() {
    player.value.stop();
    isPlaying.value = false;
  }

  paraIncrement() {
    paraCount++;
  }

  surahIncrement() {
    surahCount++;
  }

  overlayVisibilty() {
    isVisibleOverlay.value = !isVisibleOverlay.value;
    isVisibleSound.value = false;
    isVisibleText.value = false;
  }

  textVisibilty() {
    isVisibleText.value = !isVisibleText.value;
    isVisibleOverlay.value = false;
    isVisibleSound.value = false;
  }

  soundVisibilty() {
    isVisibleSound.value = !isVisibleSound.value;
    isVisibleText.value = false;
    isVisibleOverlay.value = false;
  }
}
