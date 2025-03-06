import 'package:flutter/cupertino.dart';
import 'package:tiktok_code_challenge01/features/videos/models/playback_config_model.dart';
import 'package:tiktok_code_challenge01/features/videos/repos/playback_config_repo.dart';

class PlaybackConfigViewModel extends ChangeNotifier {
  final PlaybackConfigRepo _repository;

  bool get isMuted => _repository.isMuted();
  bool get isAutoPlay => _repository.isAutoPlay();

  late final PlaybackConfigModel _model = PlaybackConfigModel(
    isMuted: _repository.isMuted(),
    isAutoPlay: _repository.isAutoPlay(),
  );

  PlaybackConfigViewModel(this._repository);

  void setMuted(bool value) {
    _repository.setMuted(value);
    _model.isMuted = value;
    notifyListeners();
  }

  void setAutoPlay(bool value) {
    _repository.setAutoPlay(value);
    _model.isAutoPlay = value;
    notifyListeners();
  }
}
