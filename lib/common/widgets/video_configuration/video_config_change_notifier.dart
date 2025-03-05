import 'package:flutter/cupertino.dart';

// deprecated
class VideoConfigChangeNotifier extends ChangeNotifier {
  bool autoMute = true;

  void toggleAutoMute() {
    autoMute = !autoMute;
    notifyListeners();
  }
}

final videoConfig = VideoConfigChangeNotifier();
